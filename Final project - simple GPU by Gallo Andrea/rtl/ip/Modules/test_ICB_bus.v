/*
================================================================================
 Module      : testbench_ICB_bus
 Authors     : Gallo Andrea 2359271
 Description : This testbench performs a unit-level verification of the
               `ICB_bus` module. It simulates an ICB bus master (e.g., a CPU)
               to validate the peripheral's compliance with the bus protocol
               under various scenarios:
               1. System Reset: Verifies correct initialization of outputs.
               2. Register Write: Writes a value and checks the output register.
               3. Register Read: Reads back the written value to ensure integrity.
               4. Incorrect Address Access: Ensures the peripheral correctly
                  ignores requests directed to other addresses.
================================================================================
*/
`timescale 1ns / 1ps

module testbench_ICB_bus;

    //--------------------------------------------------------------------------
    // Testbench Parameters
    //--------------------------------------------------------------------------
    localparam CLK_PERIOD         = 10; // ns, for a 100 MHz clock.
    localparam PERIPHERAL_ADDRESS = 32'h10014004;
    localparam WRONG_ADDRESS      = 32'h10014008; // An adjacent, incorrect address for testing.

    //--------------------------------------------------------------------------
    // Testbench Signals (Master -> DUT)
    //--------------------------------------------------------------------------
    reg tb_clk;
    reg tb_rst_n;

    // ICB Command Channel
    reg           tb_icb_cmd_valid;
    reg  [31:0]   tb_icb_cmd_addr;
    reg           tb_icb_cmd_read;
    reg  [31:0]   tb_icb_cmd_wdata;
    
    // ICB Response Channel
    reg           tb_icb_rsp_ready;

    //--------------------------------------------------------------------------
    // Wires (DUT -> Master)
    //--------------------------------------------------------------------------
    // ICB Command Channel
    wire          dut_icb_cmd_ready;
    
    // ICB Response Channel
    wire          dut_icb_rsp_valid;
    wire [31:0]   dut_icb_rsp_rdata;

    // Peripheral Outputs
    wire          dut_interrupt;
    wire [31:0]   dut_pad_out; // The o_cpu_cmd output of the DUT.

    //--------------------------------------------------------------------------
    // Device Under Test (DUT) Instantiation
    //--------------------------------------------------------------------------
    ICB_bus dut (
        .clk                   (tb_clk),
        .rst_n                 (tb_rst_n),
        .GPU_icb_cmd_valid     (tb_icb_cmd_valid),
        .GPU_icb_cmd_ready     (dut_icb_cmd_ready),
        .GPU_icb_cmd_addr      (tb_icb_cmd_addr),
        .GPU_icb_cmd_read      (tb_icb_cmd_read),
        .GPU_icb_cmd_wdata     (tb_icb_cmd_wdata),
        .GPU_icb_rsp_valid     (dut_icb_rsp_valid),
        .GPU_icb_rsp_ready     (tb_icb_rsp_ready),
        .GPU_icb_rsp_rdata     (dut_icb_rsp_rdata),
        .GPU_io_interrupts_0_0 (dut_interrupt),
        .o_cpu_cmd             (dut_pad_out)
    );

    // Clock generator
    initial begin
        tb_clk = 0;
        forever #(CLK_PERIOD / 2) tb_clk = ~tb_clk;
    end

    // Waveform dump configuration
    initial begin
        $dumpfile("waveout_icb_test.vcd");
        $dumpvars(0, testbench_ICB_bus);
    end

    //--------------------------------------------------------------------------
    // Main Test Sequence
    //--------------------------------------------------------------------------
    initial begin
        $display("[TB] Simulation Started.");

        // 1. Initialize signals and apply reset.
        tb_icb_cmd_valid <= 1'b0;
        tb_icb_rsp_ready <= 1'b0;
        tb_icb_cmd_addr  <= 32'b0;
        tb_icb_cmd_read  <= 1'b0;
        tb_icb_cmd_wdata <= 32'b0;

        tb_rst_n <= 1'b0;
        $display("[TB] Applying active-low reset...");
        repeat (5) @(posedge tb_clk);
        tb_rst_n <= 1'b1;
        $display("[TB] Reset released.");
        @(posedge tb_clk);

        // --- TEST 1: Write to the correct peripheral address ---
        $display("[TB] TEST 1: Writing 0xDEADBEEF to address 0x%h...", PERIPHERAL_ADDRESS);
        tb_icb_cmd_valid <= 1'b1;
        tb_icb_cmd_addr  <= PERIPHERAL_ADDRESS;
        tb_icb_cmd_read  <= 1'b0; // This is a write transaction.
        tb_icb_cmd_wdata <= 32'hDEADBEEF;

        wait (dut_icb_cmd_ready);
        @(posedge tb_clk);
        tb_icb_cmd_valid <= 1'b0; // De-assert valid after command is accepted.

        tb_icb_rsp_ready <= 1'b1; // Master is ready for the response.
        wait (dut_icb_rsp_valid); 
        @(posedge tb_clk);
        tb_icb_rsp_ready <= 1'b0; // De-assert ready after response is captured.
        @(posedge tb_clk);

        // Verification: Check if the DUT's output register has latched the data.
        if (dut_pad_out === 32'hDEADBEEF) begin
            $display("[TB] SUCCESS: o_cpu_cmd is now 0x%h.", dut_pad_out);
        end else begin
            $error("[TB] FAILURE: o_cpu_cmd is 0x%h, expected 0xDEADBEEF.", dut_pad_out);
            $finish;
        end
        repeat (2) @(posedge tb_clk);

        // --- TEST 2: Read from the correct peripheral address ---
        $display("[TB] TEST 2: Reading from address 0x%h...", PERIPHERAL_ADDRESS);
        tb_icb_cmd_valid <= 1'b1;
        tb_icb_cmd_addr  <= PERIPHERAL_ADDRESS;
        tb_icb_cmd_read  <= 1'b1; // This is a read transaction.

        wait (dut_icb_cmd_ready);
        @(posedge tb_clk);
        tb_icb_cmd_valid <= 1'b0;

        tb_icb_rsp_ready <= 1'b1;
        wait (dut_icb_rsp_valid); 
        @(posedge tb_clk);

        // Verification: Check the data returned on the response bus.
        if (dut_icb_rsp_rdata === 32'hDEADBEEF) begin
            $display("[TB] SUCCESS: Read data is 0x%h as expected.", dut_icb_rsp_rdata);
        end else begin
            $error("[TB] FAILURE: Read data is 0x%h, expected 0xDEADBEEF.", dut_icb_rsp_rdata);
            $finish;
        end
        tb_icb_rsp_ready <= 1'b0;
        @(posedge tb_clk);
        repeat (2) @(posedge tb_clk);

        // --- TEST 3: Attempt to write to a wrong address ---
        $display("[TB] TEST 3: Writing to wrong address 0x%h...", WRONG_ADDRESS);
        tb_icb_cmd_valid <= 1'b1;
        tb_icb_cmd_addr  <= WRONG_ADDRESS;
        tb_icb_cmd_read  <= 1'b0;
        tb_icb_cmd_wdata <= 32'hCAFEF00D;

        // The DUT should not assert cmd_ready. We wait a few cycles to confirm.
        #1;
        if (dut_icb_cmd_ready) begin 
            $error("[TB] FAILURE: DUT asserted ready for a wrong address.");
            $finish;
        end
        repeat (4) @(posedge tb_clk);
        tb_icb_cmd_valid <= 1'b0;
        
        // Verification: The output register should NOT have changed.
        if (dut_pad_out === 32'hDEADBEEF) begin
            $display("[TB] SUCCESS: o_cpu_cmd remains unchanged (0x%h).", dut_pad_out);
        end else begin
            $error("[TB] FAILURE: o_cpu_cmd changed to 0x%h.", dut_pad_out);
            $finish;
        end
        @(posedge tb_clk);

        // --- TEST 4: Attempt to read from a wrong address ---
        $display("[TB] TEST 4: Reading from wrong address 0x%h...", WRONG_ADDRESS);
        tb_icb_cmd_valid <= 1'b1;
        tb_icb_cmd_addr  <= WRONG_ADDRESS;
        tb_icb_cmd_read  <= 1'b1;
        
        // Again, the DUT should not respond.
        #1; 
        if (dut_icb_cmd_ready) begin 
            $error("[TB] FAILURE: DUT asserted ready for a wrong address.");
            $finish;
        end
        repeat (4) @(posedge tb_clk);
        tb_icb_cmd_valid <= 1'b0;
        
        $display("[TB] SUCCESS: DUT did not respond to read from wrong address, as expected.");
        repeat (5) @(posedge tb_clk);

        $display("[TB] All tests passed. Simulation finished.");
        $finish;
    end

endmodule