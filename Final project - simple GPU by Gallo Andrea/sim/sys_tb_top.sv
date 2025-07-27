/*
================================================================================
 Module      : sys_tb_top
 Authors     : Gallo Andrea 2359271
 Description : This is the top-level testbench for the `e203_soc_demo` system.
               Its primary purpose is to verify the integration and end-to-end
               functionality of the custom HDMI video peripheral and the UART
               communication channel.

               Testbench Functions:
               - Generates the necessary system clocks and an active-low reset.
               - Implements UART transmitter (`uart_tx_data`) and receiver
                 (`uart_rx_data`) tasks to simulate communication with a host PC.
               - Reads character data from an external file (`input.txt`) and
                 transmits it to the DUT via the simulated UART.
               - Captures the HDMI video output signals (H_sync, V_sync, RGB)
                 for visual analysis in a waveform viewer.
               - Creates a VCD dump file ("waveout.vcd") for simulation debugging.
================================================================================
*/

`timescale 1ns/10ps
`define USING_IVERILOG


module sys_tb_top();

  //--------------------------------------------------------------------------
  // System-level Signals: Clock and Reset
  //--------------------------------------------------------------------------
  reg  clk;
  reg  lfextclk;
  reg  rst_n;

  wire hfclk = clk;

  //--------------------------------------------------------------------------
  // Simulation Control and Waveform Dumping
  //--------------------------------------------------------------------------
`ifdef USING_IVERILOG
  initial begin
    $dumpfile("waveout.vcd");
    $dumpvars(0, sys_tb_top);
  end
`endif

`ifdef USING_VCS
  initial begin
    $fsdbDumpfile("test.fsdb");
    $fsdbDumpvars;
  end
`endif

  // Set a global timeout to prevent the simulation from running indefinitely.
  initial begin
    #30ms;
    $finish;
  end

  // Initialize clock and reset signals at the start of the simulation.
  initial begin
    clk        <= 0;
    lfextclk   <= 0;
    rst_n      <= 0; // Assert active-low reset.
    gpio_in    <= 32'd0;
    #320us rst_n <= 1; // De-assert reset after a startup delay.
  end

  // Clock generator processes.
  always #18.52 clk <= ~clk;
  always #33 lfextclk <= ~lfextclk;


  //============================================================================
  //           UART Communication Simulation
  //============================================================================

  // --- UART Timing and I/O ---
  localparam int UART_PERIOD_NS = 1_000_000_000 / 115200; // Approx. 8680 ns per bit.
  
  // `gpio_in` simulates the data line from the host PC to the FPGA.
  // It is a `reg` as it is driven by this testbench.
  // By convention, gpio_in[16] is used as the SoC's UART_RX pin.
  reg [31:0] gpio_in;

  // `gpio_out` represents the data line from the FPGA to the host PC.
  // It is a `wire` as it is driven by the DUT.
  // By convention, gpio_out[17] is the SoC's UART_TX pin.
  wire [31:0] gpio_out;

  // --- Video Signal Wires ---
  // Wires to connect to the DUT's video output ports for waveform analysis.
  wire H_sync, V_sync;
  wire [7:0] Red, Green, Blue;

  // Register to store a byte received from the DUT (used in uart_rx_data).
  reg [7:0] uart_rx_byte;


  //----------------------------------------------------------------------------
  // Task: uart_tx_data
  // Description: Transmits a single byte over the simulated UART TX line.
  //----------------------------------------------------------------------------
  task uart_tx_data(input bit [7:0] tx_data);
    // 1. Start bit (line goes from IDLE high to low).
    gpio_in[16] = 1'b0;
    #(UART_PERIOD_NS);

    // 2. Send 8 data bits, LSB first.
    for(int i=0; i<8; i++) begin
      gpio_in[16] = tx_data[i];
      #(UART_PERIOD_NS);
    end

    // 3. Stop bit (line returns to IDLE high).
    gpio_in[16] = 1'b1;
    #(UART_PERIOD_NS);
  endtask


  //----------------------------------------------------------------------------
  // Task: uart_rx_data
  // Description: Receives a single byte from the simulated UART RX line.
  //----------------------------------------------------------------------------
  task uart_rx_data(output bit [7:0] rx_data);
    reg [7:0] rx_tmp;

    // Wait for the start bit (a falling edge on the line).
    @(negedge gpio_out[17]);
    
    // To sample robustly, wait 1.5 bit periods from the start bit's falling
    // edge to align the sampling point with the middle of the first data bit.
    #(UART_PERIOD_NS + UART_PERIOD_NS/2);
    
    // Sample the 8 data bits (LSB first).
    for(int i=0; i<8; i++) begin
      rx_tmp[i] = gpio_out[17];    // Sample the bit.
      #(UART_PERIOD_NS);           // Wait one full period to sample the middle of the next bit.
    end

    rx_data = rx_tmp; // Assign the received byte to the task's output.
  endtask


  //============================================================================
  //              Main Test Stimulus
  //============================================================================
  initial begin
    // This array will hold the test characters read from the input file.
    reg [7:0] sim_data[4:0];

    // Initialize the testbench's UART transmit line to the IDLE state (high).
    gpio_in[16] = 1'b1;

    // Load test data from an external file into the simulation.
    $readmemh("./input.txt", sim_data);    

    // Wait for the DUT to initialize completely after reset.
    // This delay is critical to ensure the SoC's CPU and peripherals are
    // ready before communication begins.
    #7ms;

    // --- Data Transmission Loop ---
    // This loop reads each character from the loaded data and sends it.
    foreach(sim_data[x]) begin
      $display("TB INFO: Sending tx_data[%x] = %x", x, sim_data[x]);
      
      // Call the UART transmit task to send the current byte.
      uart_tx_data(sim_data[x]);

      // A small delay between bytes makes the simulation more realistic,
      // preventing potential overflows in the DUT's receiver FIFO if it
      // cannot process bytes as fast as they are sent.
      #10_000; // Wait 10 us before sending the next byte.
    end
  end


// --- Optional Receiver Block ---
// This block is commented out, but it's useful to keep.
// If you wanted to test what the DUT sends back, you could uncomment it.
// It continuously waits for data and prints it.
/*initial begin
  int j = 0;

  #5ms; // Wait for initialization

  forever begin
    uart_rx_data(uart_rx_byte);
    $display("TB INFO: Received rx_data[%x] = %x", j, uart_rx_byte);
    j++;
  end
end  
*/


  //============================================================================
  //              Device Under Test (DUT) Instantiation
  //============================================================================
  e203_soc_demo uut (
      .clk_in              (clk),  
      .tck                 (), 
      .tms                 (), 
      .tdi                 (), 
      .tdo                 (),  
      .gpio_in             (gpio_in),
      .gpio_out            (gpio_out),
      .qspi_in             (),
      .qspi_out            (),      
      .qspi_sck            (),  
      .qspi_cs             (),
      // --- Custom GPU Video Outputs ---
      .H_sync              (H_sync),
      .V_sync              (V_sync),
      .Red                 (Red),
      .Green               (Green),
      .Blue                (Blue),   
      // --- System Control ---
      .erstn               (rst_n), 
      .dbgmode0_n          (1'b1), 
      .dbgmode1_n          (1'b1),
      .dbgmode3_n          (1'b1),
      .bootrom_n           (1'b0), 
      .aon_pmu_dwakeup_n   (), 
      .aon_pmu_padrst      (),    
      .aon_pmu_vddpaden    () 
  );

endmodule