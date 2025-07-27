/*
================================================================================
 Module      : test_full_system
 Authors     : Gallo Andrea 2359271
 Description : This is a full system integration testbench for the `GPU_top`
               module. It verifies the end-to-end functionality, ensuring that
               the dpram_adapter, DPRAM, and HDMI controller work together
               correctly.

               Test Sequence:
               1. The complete GPU_top module is instantiated.
               2. The testbench waits for the initial color bar pattern to
                  finish, which is a key feature of the HDMI module's startup.
               3. Once the system is in text mode, the testbench sends commands
                  to write several characters and an 'Enter' command to the DUT.
               4. The simulation runs for a duration long enough to generate
                  several full video frames.
               5. A VCD file ("waveout_full.vcd") is created for detailed visual
                  analysis of the final output signals (Hsync, Vsync, RGB) in a
                  waveform viewer like GTKWave.
================================================================================
*/
`timescale 1ns/10ps

module test_full_system;

    //--------------------------------------------------------------------------
    // Testbench Parameters
    //--------------------------------------------------------------------------
    localparam CMD_ENTER  = 32'h20000000; // Constant for the Enter key command.

    //--------------------------------------------------------------------------
    // Testbench Signals
    //--------------------------------------------------------------------------
    reg clk = 1;
    reg rst_n = 0; // The DUT uses an active-low reset.

    // --- DUT Interface ---
    reg  [31:0] pad_out;   // Simulates the CPU data bus (i_cpu_cmd).
    wire        Hsync;
    wire        Vsync;
    wire [7:0]  Red, Green, Blue;

    //--------------------------------------------------------------------------
    // DUT (Device Under Test) Instantiation
    //--------------------------------------------------------------------------
    // Instantiate the entire top-level module to test full system integration.
    GPU_top dut (
        .clk(clk),
        .rst_n(rst_n),
        .i_cpu_cmd(pad_out),
        .o_gpu_hsync(Hsync),
        .o_gpu_vsync(Vsync),
        .o_gpu_red(Red),
        .o_gpu_green(Green),
        .o_gpu_blue(Blue)
    );
    
    //--------------------------------------------------------------------------
    // Helper Task: write_character
    //--------------------------------------------------------------------------
    // This task simulates the CPU sending data for one full character.
    task write_character;
        input [7:0] char_code; // Unused parameter.
        begin
            // Drives the command bus for 18 cycles: 16 for character rows,
            // one for the end-of-character command, and one idle cycle.
            @(posedge clk); pad_out = 32'h00010000; @(posedge clk); pad_out = 32'h00020001;
            @(posedge clk); pad_out = 32'h00030002; @(posedge clk); pad_out = 32'h00040003;
            @(posedge clk); pad_out = 32'h00050004; @(posedge clk); pad_out = 32'h00060005;
            @(posedge clk); pad_out = 32'h00070006; @(posedge clk); pad_out = 32'h00080007;
            @(posedge clk); pad_out = 32'h00090008; @(posedge clk); pad_out = 32'h000A0009;
            @(posedge clk); pad_out = 32'h000B000A; @(posedge clk); pad_out = 32'h000C000B;
            @(posedge clk); pad_out = 32'h000D000C; @(posedge clk); pad_out = 32'h000E000D;
            @(posedge clk); pad_out = 32'h000F000E; @(posedge clk); pad_out = 32'h00000000; // End-of-character command.
            @(posedge clk); pad_out = 32'h00000000; // Hold bus low.
        end
    endtask

    //--------------------------------------------------------------------------
    // Clock and Reset Generation
    //--------------------------------------------------------------------------
    always #5 clk = ~clk; // 100 MHz clock generator.
    initial begin
        rst_n = 0; #100; rst_n = 1; // Generate a 100ns active-low reset pulse.
    end

    //--------------------------------------------------------------------------
    // Waveform Dump Setup
    //--------------------------------------------------------------------------
    initial begin
        $dumpfile("waveout_full.vcd");
        // Dump all signals in this testbench and the entire DUT hierarchy.
        $dumpvars(0, test_full_system); 
    end
    
    //--------------------------------------------------------------------------
    // Main Test Sequence
    //--------------------------------------------------------------------------
    initial begin
        $display("--- STARTING FULL SYSTEM INTEGRATION TEST ---");
        
        // Initialize the command bus to an idle state.
        pad_out = 32'h0;

        // Wait for the active-low reset to be de-asserted.
        @(posedge rst_n);
        @(posedge clk);

        // --- PHASE 1: Wait for Color Bar Mode to End ---
        // The HDMI module displays color bars for COLOR_BAR_DURATION_CYCLES (50,000).
        // At a 10ns clock period, this duration is 50,000 * 10ns = 500,000 ns (500 us).
        $display("[%0t ns] Waiting for color bar test pattern to finish...", $time);
        #500000; // Wait 500 us.
        @(posedge clk);
        $display("[%0t ns] Text mode should now be active. Starting to write characters.", $time);
        
        // --- PHASE 2: Write Characters to the Framebuffer ---
        // We wait for the start of the next Vertical Sync pulse. This guarantees
        // that we are entering the Vertical Blanking Interval (VBI), which is the
        // ideal and safe time to write to the framebuffer.
        $display("[%0t ns] Waiting for next Vsync to safely write to framebuffer...", $time);
        @(posedge Vsync); // Synchronize with the rising edge of the Vsync pulse.
        @(negedge Vsync); // Wait for the falling edge to ensure we are in the vertical back porch.
        
        // At this point, we are certain that the `is_in_active_area` signal inside the
        // HDMI controller is low, so writes will be enabled.
        // We can now perform all our write operations in a quick burst.
        $display("[%0t ns] VBI detected. Writing all characters in a burst.", $time);
        
        // Write character 'H'
        write_character(0);

        // Write character 'I'
        write_character(0);
        
        // Send the Enter command
        @(posedge clk);
        pad_out = CMD_ENTER;
        @(posedge clk);
        pad_out = 32'h00000000; // De-assert the command from the bus.

        // Write character '!'
        write_character(0);

        // --- PHASE 3: Run Simulation for Observation ---
        // A 640x480@60Hz frame takes approx. 16.67 ms.
        // We run for 50 ms (50,000,000 ns) to allow ample time to observe ~3 full
        // frames being drawn with the text data we just wrote.
        $display("[%0t ns] Running simulation for 50ms to observe video output...", $time);
        #50000000;
        
        $display("--- FULL SYSTEM TEST FINISHED ---");
        $display("Please analyze 'waveout_full.vcd' to verify the video output.");
        $finish;
    end
endmodule