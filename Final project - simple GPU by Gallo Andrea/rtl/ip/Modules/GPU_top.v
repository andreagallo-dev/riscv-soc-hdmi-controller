/*
================================================================================
 Module      : GPU_top
 Authors     : Gallo Andrea 2359271 
 Description : This is the top-level module of the GPU. It integrates the three
               core components of the hardware design to form a complete video
               display controller.

               The data flow is as follows:
               1. The CPU sends a 32-bit command (`i_cpu_cmd`).
               2. `dpram_adapter` decodes this command into a write address,
                  write data, and a write enable signal for the framebuffer.
               3. `Gowin_DPB` (the video RAM) stores this data on Port A.
               4. Concurrently, the `HDMI` module continuously reads from
                  Port B of the `Gowin_DPB` at the location corresponding to
                  the current screen pixel and generates the final video
                  output signals.
================================================================================
*/
module GPU_top (
    // --- Global Inputs ---
    input           clk,        // System clock.
    input           rst_n,      // Asynchronous active-low reset.
    input  [31:0]   i_cpu_cmd,  // 32-bit command/data from the CPU.

    // --- GPU Outputs to Video DAC/Connector ---
    output          o_gpu_hsync,  // Horizontal Sync signal.
    output          o_gpu_vsync,  // Vertical Sync signal.
    output [7:0]    o_gpu_red,    // 8-bit Red color data.
    output [7:0]    o_gpu_green,  // 8-bit Green color data.
    output [7:0]    o_gpu_blue    // 8-bit Blue color data.
);

    //--------------------------------------------------------------------------
    // Internal Wires for Inter-Module Communication
    //
    // Naming Convention:
    // _a_ prefix: Signals for Port A of the DPRAM (Write side, CPU-driven).
    // _b_ prefix: Signals for Port B of the DPRAM (Read side, HDMI-driven).
    //--------------------------------------------------------------------------

    // --- Write Side (Port A) ---
    wire [14:0] a_write_address;   // Address to write to, from dpram_adapter.
    wire [15:0] a_write_data;      // Data to write, from dpram_adapter.
    wire        we_a;              // Write enable signal from dpram_adapter.

    // --- Read Side (Port B) ---
    wire [14:0] b_read_address;    // Address to read from, from HDMI module.
    wire [15:0] b_read_data_out;   // Data read from DPRAM, to HDMI module.

    // --- Control and Status ---
    wire        reset;             // Active-high reset derived from active-low input.
    wire        hdmi_is_displaying;// Flag from HDMI, true when in active display area.

    assign reset = ~rst_n;

    //--------------------------------------------------------------------------
    // Component 1: HDMI Signal Generator (The "Reader")
    //
    // Generates video timings and reads the framebuffer to produce the final
    // color data for the screen.
    //--------------------------------------------------------------------------
    HDMI hdmi_instance (
        .clk             (clk),
        .reset           (reset),
        .pixel_data_in   (b_read_data_out),  // Input: Pixel data from the RAM.
        .pixel_addr_out  (b_read_address),   // Output: Address of the pixel to read now.
        .o_hsync         (o_gpu_hsync),
        .o_vsync         (o_gpu_vsync),
        .o_red           (o_gpu_red),
        .o_green         (o_gpu_green),
        .o_blue          (o_gpu_blue),
        .is_in_active_area (hdmi_is_displaying)
    );

    //--------------------------------------------------------------------------
    // Component 2: DPRAM Adapter (The "Writer")
    //
    // Decodes the CPU command to determine where and what to write into RAM.
    //--------------------------------------------------------------------------
    dpram_adapter adapter_instance (
        .clk          (clk),
        .reset        (reset),
        .i_cpu_cmd    (i_cpu_cmd),
        .write_enable (we_a),
        .o_dpram_addr (a_write_address), // Output: Connects to the RAM's write address port.
        .o_dpram_wdata(a_write_data)     // Output: Connects to the RAM's write data port.
    );

    // This logic prevents writes to the DPRAM while the HDMI controller is
    // actively drawing the visible area. It helps to avoid visual artifacts by
    // only allowing framebuffer updates during the blanking intervals.
    wire final_wrea = we_a && !hdmi_is_displaying;

    //--------------------------------------------------------------------------
    // Component 3: Dual-Port Block RAM (The Framebuffer)
    //
    // Instantiation of a Gowin-specific DPB RAM primitive.
    // - Port A is the write port, controlled by the CPU via the dpram_adapter.
    // - Port B is the read port, controlled by the HDMI signal generator.
    //--------------------------------------------------------------------------
    Gowin_DPB dpram_instance (
        // --- Port A: Write Port (CPU Side) ---
        .clka   (clk),
        .reseta (reset),
        .cea    (1'b1),             // Chip Enable for Port A is always active.
        .wrea   (final_wrea),       // Write Enable is controlled by our logic.
        .ada    (a_write_address),  // Write Address from adapter_instance.
        .dina   (a_write_data),     // Write Data from adapter_instance.
        .douta  (),                 // Port A read data output is unused.
        .ocea   (1'b1),             // Output Clock Enable for Port A's dout register. Always on.

        // --- Port B: Read Port (HDMI Side) ---
        .clkb   (clk),
        .resetb (reset),
        .ceb    (1'b1),             // Chip Enable for Port B is always active.
        .wreb   (1'b0),             // Port B is never written to (read-only).
        .adb    (b_read_address),   // Read Address from hdmi_instance.
        .doutb  (b_read_data_out),  // Read Data goes to hdmi_instance.
        .dinb   (),                 // Port B write data is unused.
        .oceb   (1'b1)              // Output Clock Enable for Port B's dout register. Always on.
    );

endmodule