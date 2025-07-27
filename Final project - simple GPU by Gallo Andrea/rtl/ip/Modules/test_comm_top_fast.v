/*
================================================================================
 Module      : test_fast_datapath
 Authors     : Gallo Andrea 2359271
 Description : A clean, clear testbench to verify the dpram_adapter and DPB
               working together.
               This test writes a known pattern and then reads it back,
               verifying data integrity.
================================================================================
*/
`timescale 1ns/10ps

module test_fast_datapath;

    //--------------------------------------------------------------------------
    // Signals & Parameters
    //--------------------------------------------------------------------------
    reg clk = 1;
    reg reset = 0;
    reg [31:0] cpu_command;

    wire        write_enable_from_adapter;
    wire [14:0] addr_from_adapter;
    wire [15:0] data_from_adapter;
    
    reg [14:0]  tb_read_addr;
    wire [15:0] data_from_ram;

    localparam NUM_WRITES = 15;

    //--------------------------------------------------------------------------
    // DUT Instantiation
    //--------------------------------------------------------------------------
    dpram_adapter dut_adapter (
        .clk(clk), .reset(reset), .i_cpu_cmd(cpu_command),
        .write_enable(write_enable_from_adapter),
        .o_dpram_addr(addr_from_adapter), .o_dpram_wdata(data_from_adapter)
    );

    Gowin_DPB dut_dpram (
        .clka(clk), .reseta(reset), .cea(1'b1), .wrea(write_enable_from_adapter),
        .ada(addr_from_adapter), .dina(data_from_adapter), .douta(), .ocea(1'b1),
        
        .clkb(clk), .resetb(reset), .ceb(1'b1), .wreb(1'b0),
        .adb(tb_read_addr), .doutb(data_from_ram), .dinb(), .oceb(1'b1)
    );

    //--------------------------------------------------------------------------
    // Clock & Reset Generation
    //--------------------------------------------------------------------------
    always #5 clk = ~clk; // 100 MHz
    initial begin
        reset = 1; #100; reset = 0;
    end
    initial begin
        $dumpfile("waveout_fast.vcd");
        $dumpvars(0, test_fast_datapath);
    end

    //--------------------------------------------------------------------------
    // Test Sequence
    //--------------------------------------------------------------------------
    initial begin
        $display("--- CLEAN WRITE-PATH VERIFICATION START ---");
        
        cpu_command = 32'b0;
        tb_read_addr = 15'b0;
        reset = 1;
        #100;
        reset = 0;
        @(posedge clk);

        // --- PHASE 1: WRITE a predictable pattern ---
        $display("PHASE 1: Writing data_value = address_value to RAM locations 1 through %0d...", NUM_WRITES);
        
        // We will write the value of the address into the data field.
        // Example: At address 5, we write 0x0005.
        for (integer i = 1; i <= NUM_WRITES; i = i + 1) begin
            // Format the command: {16'h0, 4'h_offset, 16'h_data}
            // In our dpram_adapter, the offset IS the address.
            cpu_command = {16'b0, i[3:0], i[15:0]};
            @(posedge clk);
        end

        // Send end-of-character command to advance the cursor (not strictly needed, but good practice)
        cpu_command = 32'h00000000;
        @(posedge clk);
        cpu_command = 32'h00000000;
        @(posedge clk);

        $display("PHASE 1: Write complete.");
        #100; // Wait a bit for stability.

        // --- PHASE 2: READ and VERIFY ---
        $display("PHASE 2: Reading back data to verify integrity...");

        // Dummy read to prime the BRAM's read pipeline.
        // This is the clean way to handle initial unknown data on the output.
        tb_read_addr = 0;
        @(posedge clk);
        @(posedge clk);
        
        for (integer i = 1; i <= NUM_WRITES; i = i + 1) begin
            // Apply the address we want to read
            tb_read_addr = i;
            @(posedge clk); // Clock cycle 1: Address is registered by BRAM
            
            #1; // Wait a moment before the checking edge for clarity in waveform
            
            @(posedge clk); // Clock cycle 2: Data appears on the output bus
            
            // Now, data_from_ram should hold the value for address 'i'
            if (data_from_ram === i) begin
                $display("  OK: Addr[0x%h] -> Read: 0x%h. Expected: 0x%h", i, data_from_ram, i);
            end else begin
                $error("  FAIL: Addr[0x%h] -> Read: 0x%h. Expected: 0x%h", i, data_from_ram, i);
            end
        end

        $display("--- CLEAN WRITE-PATH VERIFICATION FINISHED ---");
        $finish;
    end
endmodule