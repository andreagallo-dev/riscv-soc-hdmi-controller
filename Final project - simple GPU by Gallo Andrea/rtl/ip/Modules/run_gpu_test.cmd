@echo off
REM ============================================================================
REM  File        : run_gpu_test.bat
REM  Authors     : Gallo Andrea 2359271
REM  Description : Batch script for running the full system local simulation of
REM                the complete GPU subsystem using Icarus Verilog.
REM
REM  This script automates the following steps:
REM  1. Compiles ALL Verilog source files required for the GPU design,
REM     including the top-level module and the full integration testbench.
REM  2. Links the compiled objects into a simulation executable (`.vvp` file).
REM  3. Executes the full system simulation.
REM  4. Reports the status of the process.
REM ============================================================================

ECHO [INFO] Starting compilation of the full GPU subsystem...

REM The 'iverilog' command invokes the Icarus Verilog compiler.
REM -o gpu_test.vvp: Specifies the name of the output file.
REM The '^' character is used to continue a command onto the next line.
iverilog -o gpu_test.vvp ^
    GPU_top.v ^
    dpram_adapter.v ^
    HDMI.v ^
    gowin_dpb.v ^
    test_comm_top.v ^
    ../../../sim/gowin_sim_lib/gw2a/prim_sim.v

REM Check the exit code of the last command (iverilog).
REM A non-zero %ERRORLEVEL% indicates that the compilation failed.
IF %ERRORLEVEL% NEQ 0 (
    ECHO [ERROR] Compilation failed! Review the Icarus Verilog error messages above.
    GOTO :EOF
)

ECHO [INFO] Compilation completed successfully.
ECHO [INFO] Launching full system simulation...

REM The 'vvp' command is the Icarus Verilog runtime engine that executes the
REM compiled simulation file.
vvp gpu_test.vvp

ECHO [INFO] Simulation finished.
ECHO [INFO] A waveform file has been generated for the full system test.
ECHO [INFO] You can analyze it using a waveform viewer like GTKWave.

:EOF