/*
================================================================================
 Module      : testbench_adapter
 Authors     : Gallo Andrea 2359271
 Description : This testbench verifies the functionality of the dpram_adapter
               module. It simulates a sequence of character writes and special
               commands (Delete, Enter) to ensure that the adapter generates
               the correct addresses, data, and internal state transitions.
               
               The test sequence covers:
               1. Initial state after reset.
               2. Writing two consecutive characters.
               3. Using the 'Delete' command to move the cursor back.
               4. Writing a character to an overwritten position.
               5. Using the 'Enter' command to advance to the next line.
               6. Writing a character at the start of a new line.
================================================================================
*/

`timescale 1ns/10ps

module testbench_adapter;

    //--------------------------------------------------------------------------
    // Testbench Parameters
    //--------------------------------------------------------------------------
    // Defines constants for the special command flags for better readability.
    localparam CMD_RESET  = 32'h80000000; // Simulates the FLAG_RESET_ADDR command.
    localparam CMD_DELETE = 32'h40000000; // Simulates the FLAG_DELETE command.
    localparam CMD_ENTER  = 32'h20000000; // Simulates the FLAG_ENTER command.

    //--------------------------------------------------------------------------
    // Testbench Signals
    //--------------------------------------------------------------------------
    reg        clk = 1;
    reg        reset = 0;
    reg [31:0] pad_out; // Simulates the CPU data bus driving the DUT's i_cpu_cmd input.

    // Wires to capture the outputs of the Device Under Test (DUT).
    wire [14:0] o_dpram_addr;
    wire [15:0] o_dpram_wdata;

    // A wire for probing an internal register of the DUT for easier debugging.
    // This provides visibility into the state of character_position without
    // making it an output port of the DUT.
    wire [14:0] character_position;

    //--------------------------------------------------------------------------
    // Device Under Test (DUT) Instantiation
    //--------------------------------------------------------------------------
    dpram_adapter dut (
        .clk         (clk),
        .reset       (reset),
        .i_cpu_cmd   (pad_out),
        .o_dpram_addr(o_dpram_addr),
        .o_dpram_wdata(o_dpram_wdata)
    );

    // Hierarchical reference to probe the DUT's internal character_position register.
    assign character_position = dut.character_position;

    //--------------------------------------------------------------------------
    // Helper Task: write_character_unrolled
    //--------------------------------------------------------------------------
    /**
     * @brief Simulates the process of writing a full 16-row character.
     * @param char_code (Unused) Input kept for potential interface consistency.
     *
     * This task drives the pad_out signal for 17 consecutive clock cycles:
     * - 16 cycles to send the pixel data for each row of a character,
     *   with incrementing offsets and data values for simulation purposes.
     * - 1 cycle to send the end-of-character command (all zeros).
     */
    task write_character_unrolled;
        input [7:0] char_code;

        begin
            // Simulate writing 16 rows of a character with dummy data.
            @(posedge clk); pad_out = 32'h00010000; // Row 1 (offset 1)
            @(posedge clk); pad_out = 32'h00020001; // Row 2 (offset 2)
            @(posedge clk); pad_out = 32'h00030002;
            @(posedge clk); pad_out = 32'h00040003;
            @(posedge clk); pad_out = 32'h00050004;
            @(posedge clk); pad_out = 32'h00060005;
            @(posedge clk); pad_out = 32'h00070006;
            @(posedge clk); pad_out = 32'h00080007;
            @(posedge clk); pad_out = 32'h00090008;
            @(posedge clk); pad_out = 32'h000A0009;
            @(posedge clk); pad_out = 32'h000B000A;
            @(posedge clk); pad_out = 32'h000C000B;
            @(posedge clk); pad_out = 32'h000D000C;
            @(posedge clk); pad_out = 32'h000E000D;
            @(posedge clk); pad_out = 32'h000F000E;
            @(posedge clk); pad_out = 32'h0010000F; // Row 16 (offset 16) - Note: offset is 4 bits

            // Send the end-of-character command (offset and data are zero).
            @(posedge clk);
            pad_out = 32'h00000000;

            // Hold the bus at zero for an extra cycle to ensure clean behavior
            // between operations and allow the DUT's FSM to stabilize.
            @(posedge clk);
            pad_out = 32'h00000000; 
        end
    endtask

    //--------------------------------------------------------------------------
    // Simulation Setup
    //--------------------------------------------------------------------------
    // Generate a VCD (Value Change Dump) file for waveform analysis.
    initial begin
        $dumpfile("waveout_dpram_adapter.vcd");
        $dumpvars(0, testbench_adapter);
    end

    // Clock generator (100 MHz clock with a 10 ns period).
    always #5 clk = ~clk;

    // Asynchronous reset pulse generation at the start of the simulation.
    initial begin
        reset = 1; 
        #20; // Hold reset active for 20 ns.
        reset = 0;
    end

    //--------------------------------------------------------------------------
    // Main Test Stimulus Sequence
    //--------------------------------------------------------------------------
    initial begin
        // Initialize the command bus to a known, idle state.
        pad_out = 32'h0;

        // Wait for the asynchronous reset to complete.
        @(negedge reset);

        // Re-synchronize with the clock edge before starting the test sequence.
        @(posedge clk);

        // --- Scenario 1: Write two normal characters ---
        $display("TEST: Writing character 'A' (at pos 0).");
        write_character_unrolled(0); // Expected final position: 1

        $display("TEST: Writing character 'B' (at pos 1).");
        write_character_unrolled(0); // Expected final position: 2

        // --- Scenario 2: Press 'Delete' then write a new character ---
        $display("TEST: Pressing Delete key. Cursor should move from 2 to 1.");
        @(posedge clk); pad_out = CMD_DELETE;
        // The DUT will now be in 'delete mode'.

        $display("TEST: Writing character 'C' (overwrite at pos 1).");
        write_character_unrolled(0); // Expected final position: 2

        // --- Scenario 3: Press 'Enter' then write a new character ---
        $display("TEST: Pressing Enter key. Cursor moves to next line (pos 40).");
        @(posedge clk); pad_out = CMD_ENTER;

        $display("TEST: Writing character 'D' on the new line (at pos 40).");
        write_character_unrolled(0); // Expected final position: 41

        // --- End of Test ---
        // Allow a few more cycles to observe the final state before finishing.
        @(posedge clk);
        #100;
        $display("TEST: Simulation finished.");
        $finish;
    end

endmodule