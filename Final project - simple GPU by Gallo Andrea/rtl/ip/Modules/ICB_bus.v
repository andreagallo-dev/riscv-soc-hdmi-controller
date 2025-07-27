/*
================================================================================
 Module      : ICB_bus
 Authors     : Gallo Andrea 2359271
 Description : This module acts as a bridge between the system's Interconnect
               Bus (ICB) and the custom GPU core. It implements an ICB slave
               that responds to a specific peripheral address. Its key function
               is to receive a command from the CPU via the bus and provide a
               stable, continuous command signal to the GPU's internal modules.
================================================================================
*/
module ICB_bus (
    // --- System Inputs ---
    input                   clk,
    input                   rst_n,

    // --- ICB Bus - Command Channel (from CPU Master) ---
    input                   GPU_icb_cmd_valid, // Master asserts this when a command is valid.
    output                  GPU_icb_cmd_ready, // Slave asserts this when it's ready to accept a command.
    input  [31:0]           GPU_icb_cmd_addr,  // Address for the transaction.
    input                   GPU_icb_cmd_read,  // 1 for a read, 0 for a write.
    input  [31:0]           GPU_icb_cmd_wdata, // Data for a write transaction.

    // --- ICB Bus - Response Channel (to CPU Master) ---
    output                  GPU_icb_rsp_valid, // Slave asserts this when the response is valid.
    input                   GPU_icb_rsp_ready, // Master asserts this when it's ready for a response.
    output [31:0]           GPU_icb_rsp_rdata, // Data for a read response.

    // --- Peripheral Outputs ---
    output                  GPU_io_interrupts_0_0, // Interrupt output (unused, tied low).
    output [31:0]           o_cpu_cmd              // The 32-bit command forwarded to the GPU core.
);

    //--------------------------------------------------------------------------
    // Parameters and Internal Signals
    //--------------------------------------------------------------------------
    // The specific memory-mapped address assigned to this GPU peripheral.
    localparam PERIPHERAL_ADDRESS = 32'h10014004;

    wire        reset = ~rst_n;          // Convert active-low reset to active-high.
    reg [31:0]  gpu_command_register;    // Holds the command to be sent to the GPU.
    reg         response_is_valid_internal; // Internal flag to drive the response channel.
    reg [31:0]  read_data_buffer;        // Buffers data for read responses.

    //--------------------------------------------------------------------------
    // Address Decoding and Transaction Logic
    //--------------------------------------------------------------------------
    // Decode if the current transaction is targeting this peripheral.
    wire is_our_address = (GPU_icb_cmd_addr == PERIPHERAL_ADDRESS);
    
    // A write operation occurs when a valid write command targets our address.
    wire write_enable   = GPU_icb_cmd_valid && !GPU_icb_cmd_read && is_our_address;
    
    // A read operation occurs when a valid read command targets our address.
    wire read_enable    = GPU_icb_cmd_valid &&  GPU_icb_cmd_read && is_our_address;

    //--------------------------------------------------------------------------
    // ICB Handshake and Peripheral Output Connections
    //--------------------------------------------------------------------------
    // In this simple implementation, the slave is always ready for a command.
    assign GPU_icb_cmd_ready = is_our_address; 
    
    // Drive the ICB response signals from our internal registers.
    assign GPU_icb_rsp_valid = response_is_valid_internal;
    assign GPU_icb_rsp_rdata = read_data_buffer;

    // The output to the GPU core is directly driven by the command register.
    assign o_cpu_cmd = gpu_command_register;
    
    // This peripheral does not generate interrupts.
    assign GPU_io_interrupts_0_0 = 1'b0;

    //--------------------------------------------------------------------------
    // Core Register and Bus Logic
    //--------------------------------------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            gpu_command_register       <= 32'b0;
            response_is_valid_internal <= 1'b0;
            read_data_buffer           <= 32'b0;
        end else begin
            // The command register is designed to latch a new value only when a
            // valid write transaction occurs. It holds its value at all other
            // times, providing a stable command signal to the GPU.
            if (write_enable) begin
                gpu_command_register <= GPU_icb_cmd_wdata;
            end
            
            // The response logic asserts a one-cycle `valid` pulse following
            // any completed read or write transaction directed at this module.
            if (write_enable) begin
                // For a write, signal completion.
                response_is_valid_internal <= 1'b1;
            end else if (read_enable) begin
                // For a read, latch the current register value into the read
                // buffer and signal that the response data is valid.
                read_data_buffer <= gpu_command_register;
                response_is_valid_internal <= 1'b1;
            end else begin
                // In all other cases, the response is not valid.
                response_is_valid_internal <= 1'b0;
            end
        end
    end

endmodule