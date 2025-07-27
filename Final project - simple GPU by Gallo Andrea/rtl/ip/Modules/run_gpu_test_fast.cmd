@echo off
REM ============================================================================
REM  File        : run_gpu_test_fast.bat
REM  Authors     : Gallo Andrea 2359271
REM  Description : Batch script for running a "fast" local simulation of the
REM                GPU's write-path subsystem using Icarus Verilog.
REM
REM  This script automates the following steps:
REM  1. Compiles the necessary Verilog source files, including the DUTs
REM     (dpram_adapter, gowin_dpb), the specific testbench for this test
REM     (test_comm_top_fast.v), and the Gowin simulation library.
REM  2. Links the compiled objects into a simulation executable (`.vvp` file).
REM  3. Executes the simulation.
REM  4. Reports the status of the process.
REM ============================================================================

ECHO [INFO] Starting 'fast' test compilation for the GPU write-path...

REM The 'iverilog' command invokes the Icarus Verilog compiler.
REM -o gpu_test_fast.vvp: Specifies the name of the output file.
REM The '^' character is used to continue a command onto the next line,
REM which improves the readability of the file list.
iverilog -o gpu_test_fast.vvp ^
    dpram_adapter.v ^
    gowin_dpb.v ^
    test_comm_top_fast.v ^
    ../../../sim/gowin_sim_lib/gw2a/prim_sim.v

REM Check the exit code of the last command (iverilog).
REM In batch scripts, %ERRORLEVEL% contains the return code. A value of 0
REM typically means success, while any non-zero value indicates an error.
IF %ERRORLEVEL% NEQ 0 (
    ECHO [ERROR] Compilation failed! Review the Icarus Verilog error messages above.
    GOTO :EOF
)

ECHO [INFO] Compilation completed successfully.
ECHO [INFO] Launching simulation...

REM The 'vvp' command is the Icarus Verilog runtime engine that executes the
REM compiled simulation file created in the previous step.
vvp gpu_test_fast.vvp

ECHO [INFO] Simulation finished.
ECHO [INFO] A waveform file has been generated: 'waveout_fast.vcd'.
ECHO [INFO] You can analyze it using a waveform viewer like GTKWave.

:EOF