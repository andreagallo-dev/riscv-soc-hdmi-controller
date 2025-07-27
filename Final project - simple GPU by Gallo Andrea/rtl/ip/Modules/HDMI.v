/*
================================================================================
 Module      : HDMI
 Authors     : Gallo Andrea 2359271 
 Description : This module is the core video signal generator for the GPU. It is
               responsible for generating a 640x480@60Hz VGA-compatible signal
               and managing the content displayed on the screen.

               Key Functions:
               - Generates precise VGA timing signals (hsync, vsync).
               - Implements a dual-mode display system:
                 1. Color Bar Mode: On startup, it displays a color bar test
                    pattern for a fixed duration.
                 2. Text Mode: After the initial test, it switches to reading
                    character data from a Dual-Port RAM (DPRAM) and rendering
                    it as monochrome text.
               - Calculates and outputs the read addresses for the video DPRAM.
================================================================================
*/

module HDMI (
    // --- Inputs ---
    input           reset,               // Active-high asynchronous reset.
    input           clk,                 // System clock (pixel clock).
    input  [15:0]   pixel_data_in,       // 16-bit data word read from the video DPRAM.

    // --- Outputs ---
    output [14:0]   pixel_addr_out,      // Address sent to the DPRAM's read port.
    output          o_hsync,             // Horizontal Sync signal.
    output          o_vsync,             // Vertical Sync signal.
    output [7:0]    o_red,               // 8-bit Red color data.
    output [7:0]    o_green,             // 8-bit Green color data.
    output [7:0]    o_blue,              // 8-bit Blue color data.
    output          is_in_active_area    // Flag indicating the beam is in the visible area.
);

//=============================================================================
// SECTION 1: Parameters and Internal Signal Declarations
//=============================================================================

    //-------------------------------------------------------------------------
    // VGA Timing Parameters for 640x480 @ 60Hz.
    // Note: Porch values have been adjusted to compensate for the system
    // clock frequency not being an exact multiple of the standard pixel clock.
    //-------------------------------------------------------------------------
    localparam H_DISPLAY        = 12'd640;
    localparam H_SYNC_PULSE     = 12'd96;
    localparam H_BACK_PORCH     = 12'd48 + 12'd19;
    localparam H_FRONT_PORCH    = 12'd16 + 12'd9;
    localparam H_TOTAL          = 12'd800 + 12'd28; // Total clocks per line

    localparam V_DISPLAY        = 12'd480;
    localparam V_SYNC_PULSE     = 12'd2;
    localparam V_BACK_PORCH     = 12'd33 + 12'd12;
    localparam V_FRONT_PORCH    = 12'd10 + 12'd6;
    localparam V_TOTAL          = 12'd525 + 12'd18; // Total lines per frame

    localparam SCREEN_WIDTH = 40; // Screen width in characters.

    //-------------------------------------------------------------------------
    // Color Definitions (24-bit, ordered as {Blue, Green, Red}).
    //-------------------------------------------------------------------------
    localparam C_WHITE   = {8'd255, 8'd255, 8'd255};
    localparam C_BLACK   = {8'd0,   8'd0,   8'd0};
    localparam C_RED     = {8'd0,   8'd0,   8'd255};
    localparam C_GREEN   = {8'd0,   8'd255, 8'd0};
    localparam C_BLUE    = {8'd255, 8'd0,   8'd0};
    localparam C_SKYBLUE = {8'd235, 8'd206, 8'd135};
    localparam C_TEAL    = {8'd128, 8'd128, 8'd0};
    localparam C_ORANGE  = {8'd0,   8'd165, 8'd255};
    
    //-------------------------------------------------------------------------
    // Internal Registers and Wires
    //-------------------------------------------------------------------------
    // --- Timing and Position ---
    reg [11:0] h_pos_counter;        // Horizontal pixel counter (0 to H_TOTAL-1).
    reg [11:0] v_pos_counter;        // Vertical line counter (0 to V_TOTAL-1).

    // --- Mode Control ---
    reg [27:0] mode_switch_timer;    // Timer for the initial color bar display duration.
    reg        text_display_mode;    // Global flag: 0=ColorBar Mode, 1=Text Mode.

    // --- Color Bar Generation Logic ---
    reg [7:0]  colorbar_pixel_counter; // Counts pixels within one color strip (0-79).
    reg [3:0]  colorbar_strip_counter; // Selects which of the 8 color strips is active.
    reg [23:0] colorbar_current_color; // Holds the color for the current strip.

    // --- Text Mode Rendering Logic ---
    // These counters determine which character and pixel to display.
    reg [5:0]  char_pixel_col_counter;   // Horizontal pixel position within a character (0-15).
    reg [5:0]  char_pixel_col_delayed;   // Delayed version of the above for pipelined RAM reads.
    reg [5:0]  char_pixel_row_counter;   // Vertical pixel position within a character (0-15).
    reg [5:0]  screen_char_col_counter;  // Character column on screen (0-39).
    reg [5:0]  screen_char_row_counter;  // Character row on screen (0-29).

    // --- Final Pixel Generation ---
    wire        pixel_is_on;            // True if the current text pixel should be lit.
    reg  [23:0] monochrome_pixel_color; // Holds the final Black/White color for a text pixel.
    wire [23:0] final_pixel_data;       // The final 24-bit color data sent to the outputs.


//=============================================================================
// SECTION 2: Pixel Position Timing Generator
//
// This block implements the core raster-scan counters. `h_pos_counter` and
// `v_pos_counter` continuously sweep, defining the current pixel coordinates.
//=============================================================================
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            h_pos_counter <= 12'd0;
            v_pos_counter <= 12'd0;
        end else begin
            if (h_pos_counter < H_TOTAL - 1) begin
                // Increment horizontal counter for each pixel clock.
                h_pos_counter <= h_pos_counter + 1;
            end else begin
                h_pos_counter <= 12'd0; // End of line, reset horizontal counter.
                if (v_pos_counter < V_TOTAL - 1) begin
                    // Increment vertical counter once per line.
                    v_pos_counter <= v_pos_counter + 1;
                end else begin
                    v_pos_counter <= 12'd0; // End of frame, reset vertical counter.
                end
            end
        end
    end

//=============================================================================
// SECTION 3: Color Bar Test Pattern Generation
//
// This logic is active only when `text_display_mode` is 0. It divides the
// screen into 8 vertical strips of different colors.
//=============================================================================
    
    // Flags to determine if the current position is within the visible display area.
    wire is_in_active_h = (h_pos_counter >= H_SYNC_PULSE + H_BACK_PORCH) &&
                          (h_pos_counter < H_SYNC_PULSE + H_BACK_PORCH + H_DISPLAY);
    wire is_in_active_v = (v_pos_counter >= V_SYNC_PULSE + V_BACK_PORCH) &&
                          (v_pos_counter < V_SYNC_PULSE + V_BACK_PORCH + V_DISPLAY);
    assign is_in_active_area = is_in_active_h && is_in_active_v;

    // --- Color Bar Strip Counters ---
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            colorbar_pixel_counter <= 8'd0;
            colorbar_strip_counter <= 4'd0;
        end else begin
            if (is_in_active_area) begin
                if (colorbar_pixel_counter == (H_DISPLAY / 8) - 1) begin
                    // Reached the end of a color strip (80 pixels wide).
                    colorbar_pixel_counter <= 8'd0;
                    colorbar_strip_counter <= colorbar_strip_counter + 1;
                end else begin
                    // Count pixels within the current strip.
                    colorbar_pixel_counter <= colorbar_pixel_counter + 1;
                end
            end else begin
                // In blanking interval, reset the pixel counter.
                colorbar_pixel_counter <= 8'd0;
                
                // At the start of a new visible line, reset the strip counter.
                // This specific condition ensures the counter is correctly set at the
                // beginning of the active display area.
                if ( (h_pos_counter == H_SYNC_PULSE + H_BACK_PORCH -1) && is_in_active_v ) begin
                    colorbar_strip_counter <= 4'd1; // Start with the first strip.
                end else if (colorbar_strip_counter > 8) begin 
                    colorbar_strip_counter <= 4'd1; // Safety reset.
                end
            end
        end
    end

    // --- Color Selection Decoder ---
    // Combinational logic that maps the current strip number to a 24-bit color.
    always @(*) begin
        case (colorbar_strip_counter)
            4'd1:    colorbar_current_color = C_WHITE;
            4'd2:    colorbar_current_color = C_TEAL;
            4'd3:    colorbar_current_color = C_SKYBLUE;
            4'd4:    colorbar_current_color = C_GREEN;
            4'd5:    colorbar_current_color = C_ORANGE;
            4'd6:    colorbar_current_color = C_RED;
            4'd7:    colorbar_current_color = C_BLUE;
            4'd8:    colorbar_current_color = C_BLACK;
            default: colorbar_current_color = C_BLACK; // Default color for safety.
        endcase
    end

//=============================================================================
// SECTION 4: Character Display and DPRAM Address Generation
//
// This logic is active when `text_display_mode` is 1. It calculates the
// correct DPRAM read address based on the current pixel being drawn.
//=============================================================================

    // --- Horizontal Character Position Counters ---
    // These counters update on every clock cycle inside the active display area.
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            screen_char_col_counter <= 6'd0;
            char_pixel_col_counter  <= 6'd0;
        end else begin
            if (is_in_active_area) begin
                if (char_pixel_col_counter < 15) begin
                    // Advance pixel column within the current character.
                    char_pixel_col_counter <= char_pixel_col_counter + 1;
                end else begin
                    char_pixel_col_counter <= 6'd0; // End of character width, reset.
                    if (screen_char_col_counter < (SCREEN_WIDTH - 1)) begin
                        // Advance to the next character cell on the screen.
                        screen_char_col_counter <= screen_char_col_counter + 1;
                    end else begin
                        screen_char_col_counter <= 6'd0; // End of screen line, reset.
                    end
                end
            end else begin
                // In blanking interval, reset horizontal counters for the next line.
                screen_char_col_counter <= 6'd0;
                char_pixel_col_counter  <= 6'd0;
            end
        end
    end

    // --- Vertical Character Position Counters ---
    // These counters update ONLY at the end of a full horizontal line.
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            screen_char_row_counter <= 6'd0;
            char_pixel_row_counter  <= 6'd0;
        end else begin
            if (h_pos_counter == H_TOTAL - 1) begin // This event occurs once per line.
                if (is_in_active_v) begin
                    if (char_pixel_row_counter < 15) begin
                        // Advance to the next pixel row of the same character row.
                        char_pixel_row_counter <= char_pixel_row_counter + 1;
                    end else begin
                        char_pixel_row_counter <= 6'd0; // End of character height, reset.
                        if (screen_char_row_counter < 29) begin // 30 rows total (0-29).
                            // Advance to the next row of characters on the screen.
                            screen_char_row_counter <= screen_char_row_counter + 1;
                        end else begin
                            screen_char_row_counter <= 6'd0; // Safety reset.
                        end
                    end
                end
                // At the very end of the frame, reset vertical counters.
                if (v_pos_counter == V_TOTAL - 1) begin
                    screen_char_row_counter <= 6'd0;
                    char_pixel_row_counter  <= 6'd0;
                end
            end
        end
    end

    // --- Pipelined Pixel Counter for Memory Read ---
    // The DPRAM has a 1-cycle read latency. We must use the pixel column
    // value from the previous clock cycle to select the correct bit from
    // the just-arrived `pixel_data_in`.
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            char_pixel_col_delayed <= 6'd0;
        end else begin
            char_pixel_col_delayed <= char_pixel_col_counter;
        end
    end

    // --- Final DPRAM Address Calculation ---
    // Address = (Base Address of Character) + (Row offset within character)
    // Base Address = (char_row * width + char_col) * 16
    assign pixel_addr_out = (screen_char_row_counter * SCREEN_WIDTH + screen_char_col_counter) * 16 + char_pixel_row_counter;


    // --- Pixel Data Extraction and Color Mapping ---
    // Selects one bit from the 16-bit word read from DPRAM. The font is stored
    // with the leftmost pixel at the MSB (bit 15).
    assign pixel_is_on = pixel_data_in[15 - char_pixel_col_delayed];

    // Maps the single pixel bit (ON/OFF) to a 24-bit black or white color.
    always @(*) begin
        monochrome_pixel_color = pixel_is_on ? C_WHITE : C_BLACK;
    end
    
//=============================================================================
// SECTION 5: Mode Flag Generator (Color Bars vs. Text)
//
// Controls the display mode. On startup, it runs a timer. When the timer
// expires, it permanently switches from color bar mode to text display mode.
//=============================================================================
    localparam COLOR_BAR_DURATION_CYCLES = 50000;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            mode_switch_timer <= 28'd0;
            text_display_mode <= 1'b0; // Start in Color Bar mode.
        end else begin
            if (mode_switch_timer < COLOR_BAR_DURATION_CYCLES) begin
                // While timer is running, stay in color bar mode.
                mode_switch_timer <= mode_switch_timer + 1;
                text_display_mode <= 1'b0;
            end else begin
                // Timer has expired, switch to Text Display mode permanently.
                text_display_mode <= 1'b1;
            end
        end
    end

//=============================================================================
// SECTION 6: Final Output Generation
//=============================================================================

    // --- Sync Signal Generation ---
    assign o_hsync = (h_pos_counter < H_SYNC_PULSE);
    assign o_vsync = (v_pos_counter < V_SYNC_PULSE);

    // --- Final Pixel Data Multiplexer ---
    // Selects the output color based on the display mode and screen area.
    assign final_pixel_data = text_display_mode == 1'b0 ? colorbar_current_color : // If in Color Bar mode...
                              is_in_active_area    ? monochrome_pixel_color : // If in Text mode and active area...
                                                     C_BLACK;                 // If in Text mode and blanking area...

    // --- RGB Output Assignment ---
    // Splits the 24-bit final pixel data into three 8-bit color channels.
    // The color ordering is {Blue, Green, Red} as defined in the parameters.
    assign o_red   = final_pixel_data[7:0];
    assign o_green = final_pixel_data[15:8];
    assign o_blue  = final_pixel_data[23:16];

endmodule