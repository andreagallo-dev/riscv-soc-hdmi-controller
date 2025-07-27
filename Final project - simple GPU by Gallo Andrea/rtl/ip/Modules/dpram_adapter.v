/*
================================================================================
 Module      : dpram_adapter
 Authors     : Gallo Andrea 2359271
 Description : This module acts as an adapter between a CPU and a Dual-Port RAM
               (DPRAM) used as a video framebuffer. It translates a 32-bit
               command from the CPU into the appropriate write address, data,
               and enable signals for the DPRAM.

               Command Format (i_cpu_cmd[31:0]):
               - [31]   : Synchronous Reset Flag
               - [30]   : Delete/Backspace Flag
               - [29]   : Enter/Newline Flag
               - [28:20]: Unused
               - [19:16]: Character row offset (0-15)
               - [15:0] : 16-bit pixel data for the character row

               The module uses a 3-state Finite State Machine (FSM) to manage
               the character writing sequence and handles high-priority flag
               commands (Reset, Delete, Enter) immediately.
================================================================================
*/

module dpram_adapter (
    input           clk,
    input           reset,
    input  [31:0]   i_cpu_cmd,
    output          write_enable,
    output [14:0]   o_dpram_addr,
    output [15:0]   o_dpram_wdata
);

    //--------------------------------------------------------------------------
    // Parameters
    //--------------------------------------------------------------------------
    // Defines the number of characters per line on the screen.
    // Used to calculate the address for the 'Enter' command.
    localparam SCREEN_WIDTH = 40;
    
    //--------------------------------------------------------------------------
    // FSM State Definitions
    //--------------------------------------------------------------------------
    localparam S_IDLE           = 2'b00; // Waits for the first data of a new character.
    localparam S_RUN            = 2'b01; // Processes incoming character row data.
    localparam S_POST_INCREMENT = 2'b10; // Halts after a character to prevent multiple increments.

    //--------------------------------------------------------------------------
    // Internal State Registers
    //--------------------------------------------------------------------------
    reg [14:0] character_position; // Holds the current cursor position (character index on screen).
    reg        delete_mode_active; // Flag indicating a delete operation is in progress.
    reg [1:0]  state;              // Current state of the FSM.

    //--------------------------------------------------------------------------
    // Sequential Logic (State Update)
    //--------------------------------------------------------------------------
    // This block manages all state transitions and register updates.
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Asynchronous reset to a known default state.
            character_position <= 15'b0;
            delete_mode_active <= 1'b0;
            state              <= S_IDLE;
        
        end else begin
            // --- High-Priority Command Processing ---
            // These flags are checked first and override the normal FSM flow.
            if (i_cpu_cmd[31]) begin
                // Synchronous Reset (FLAG_RESET_ADDR): Resets cursor and FSM.
                character_position <= 15'b0;
                delete_mode_active <= 1'b0;
                state              <= S_IDLE;
            end else if (i_cpu_cmd[30]) begin
                // Delete Command (FLAG_DELETE): Activates delete mode. The cursor
                // will not be incremented after the next character is written.
                delete_mode_active <= 1'b1;
            end else if (i_cpu_cmd[29]) begin
                // Enter Command (FLAG_ENTER): Moves cursor to the start of the next line.
                character_position <= (character_position / SCREEN_WIDTH + 1) * SCREEN_WIDTH;
            end else begin
                // --- FSM-Based Flow Control ---
                // Executed only if no high-priority command is active.
                case (state)
                    S_IDLE: begin
                        // Wait for the first valid row of a character (offset > 0).
                        // This signals the start of a character transmission.
                        if (i_cpu_cmd[31:16] != 16'h0000) begin
                            state <= S_RUN;
                        end
                    end

                    S_RUN: begin
                        // In RUN, we process character rows until the end-of-character
                        // command is received (offset is zero).
                        if (i_cpu_cmd[31:16] == 16'h0000) begin
                            if (delete_mode_active) begin
                                // If deleting, clear the flag but do not advance the cursor.
                                // This allows the next character (a space) to overwrite the
                                // current position.
                                delete_mode_active <= 1'b0;
                            end else begin
                                // For a normal character, advance the cursor to the next position.
                                character_position <= character_position + 1'b1;
                            end
                            // Transition to prevent re-processing the end-of-character command
                            // if it persists for more than one clock cycle.
                            state <= S_POST_INCREMENT;
                        end
                    end

                    S_POST_INCREMENT: begin
                        // Wait here until the end-of-character command is no longer present.
                        // Once new character data arrives (offset > 0), return to RUN.
                        if (i_cpu_cmd[31:16] != 16'h0000) begin
                            state <= S_RUN;
                        end
                    end
                    
                    default: begin
                        // In case of an illegal state, reset to a safe state.
                        state <= S_IDLE;
                    end
                endcase
            end
        end
    end

    //--------------------------------------------------------------------------
    // Combinational Output Logic
    //--------------------------------------------------------------------------
    
    // The write_enable signal is active only when valid pixel data is present.
    // It is disabled for special commands (flags) and for the end-of-character
    // command (where the upper bits of i_cpu_cmd are all zero).
    assign write_enable = (i_cpu_cmd[31:16] != 16'h0000) && !i_cpu_cmd[31] && !i_cpu_cmd[30] && !i_cpu_cmd[29];

    // The final DPRAM address is calculated by combining the character's base
    // address with the 4-bit row offset from the command.
    // Base Address = character_position * 16 (each character is 16 rows high)
    // Row Offset   = i_cpu_cmd[19:16]
    assign o_dpram_addr = (character_position * 16) + i_cpu_cmd[19:16];
    
    // The data to be written to the DPRAM is the 16-bit pixel data from the
    // lower part of the CPU command.
    assign o_dpram_wdata = i_cpu_cmd[15:0];

endmodule