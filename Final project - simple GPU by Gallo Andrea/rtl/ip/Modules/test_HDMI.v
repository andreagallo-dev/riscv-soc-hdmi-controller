/*
================================================================================
 Module      : testbench_HDMI
 Authors     : Gallo Andrea 2359271
 Description : This is an observational testbench for the `HDMI` module. Its
               primary purpose is to instantiate the HDMI video generator,
               provide it with clock and reset signals, and let it run for a
               fixed duration to generate a VCD waveform file.

               This testbench does not perform automatic checks or assertions.
               Verification is done by manually inspecting the output waveform
               in a tool like GTKWave. The goal is to observe:
               1. The initial color bar test pattern.
               2. The transition from color bar mode to text mode.
               3. The generation of correct sync signals (Hsync, Vsync) and
                  DPRAM read addresses in text mode.
================================================================================
*/
`timescale 1ns/10ps

module testbench_HDMI;

    //--------------------------------------------------------------------------
    // Testbench Parameters and Signals
    //--------------------------------------------------------------------------
    localparam CLK_PERIOD_NS = 37; // Clock period in nanoseconds.

    reg         clk = 1;
    reg         reset = 0;
    // This register simulates the data coming from the DPRAM. For this simple
    // observational test, it's tied to a constant value.
    reg [15:0]  pixel_data_in_tb;

    // Wires to capture the outputs of the DUT for waveform logging.
    wire        Hsync, Vsync;
    wire [7:0]  Red, Green, Blue;
    wire [14:0] pixel_addr_out_from_dut;


    //--------------------------------------------------------------------------
    // Device Under Test (DUT) Instantiation
    //--------------------------------------------------------------------------
    HDMI dut (
        .clk             (clk),
        .reset           (reset),
        .pixel_data_in   (pixel_data_in_tb),
        .pixel_addr_out  (pixel_addr_out_from_dut),
        .o_hsync         (Hsync),
        .o_vsync         (Vsync),
        .o_red           (Red),
        .o_green         (Green),
        .o_blue          (Blue)
    );


    //--------------------------------------------------------------------------
    // Simulation Setup
    //--------------------------------------------------------------------------
    // Generate a VCD (Value Change Dump) file for waveform analysis.
    initial begin
        $dumpfile("waveout_HDMI.vcd");
        $dumpvars(0, testbench_HDMI);
    end

    // Clock generator process.
    always #(CLK_PERIOD_NS / 2) clk = ~clk;

    //--------------------------------------------------------------------------
    // Main Test Stimulus
    //--------------------------------------------------------------------------
    initial begin
        // 1. Assert reset at the beginning of the simulation.
        reset = 1;
        // Provide a static input pattern to simulate the DPRAM output.
        // This pattern (alternating 1s and 0s) makes it easy to see if
        // the text rendering logic is working in the waveform.
        pixel_data_in_tb = 16'hAAAA;
        
        // 2. Hold reset for 100ns then de-assert it.
        #100;
        reset = 0;

        // 3. Let the simulation run for a fixed amount of time.
        // The duration is set long enough to observe several video frames,
        // allowing verification of the color bar mode, the switch to text
        // mode, and the stable operation of text mode.
        // H_TOTAL = 828, V_TOTAL = 543
        // Original calculation: #(3 * 828 * 543 * CLK_PERIOD_NS);
        // Using a fixed large number for simplicity and faster simulation setup.
        #50000000;
        
        // 4. Finish the simulation.
        $display("Simulation finished. Please inspect 'waveout_HDMI.vcd' to verify behavior.");
        $finish;
    end

endmodule