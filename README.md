# Custom Graphics Peripheral (GPU) for a RISC-V SoC

This project covers the full hardware/software co-design cycle for a custom graphics peripheral, integrated into a System-on-Chip (SoC) based on the Hummingbird E203 RISC-V core. The objective was to create a hardware module capable of receiving ASCII characters via a UART interface and rendering them as monochrome text on an HDMI display.

This project demonstrates end-to-end capabilities, from digital logic design in Verilog to firmware development in C.

![Whole system output](Whole system output.png)

### Key Features

*   **Hardware/Software Co-Design:** Managed the entire development flow by defining and implementing the interface between the software running on the RISC-V core and the custom hardware.
*   **Verilog-based GPU Subsystem:**
    *   **ICB Slave Interface:** A custom interface for the core's native Inter-Chip Bus (ICB).
    *   **HDMI Controller:** A module responsible for generating 640x480@60Hz video timings and rendering pixels.
    *   **Intelligent DPRAM Adapter:** Logic for decoding firmware commands and managing writes to the framebuffer.
    *   **Test Automation:** Batch scripts (`.cmd`) for automating the simulation workflow.
*   **C-based Control Firmware:** A dedicated firmware for the RISC-V core that handles UART reception, character-to-bitmap mapping, and orchestrates the hardware via a custom 32-bit command protocol.
*   **Multi-Tiered Verification:** Created Verilog testbenches for validation at both the unit level and the full-SoC level.

### Technology Stack

*   **HDL Language:** `Verilog`
*   **Firmware Language:** `C`
*   **Target Platform:** `FPGA (Gowin GW2A-18)`
*   **CPU Architecture:** `RISC-V (Hummingbird E203)`
*   **Protocols:** `ICB`, `HDMI`, `UART`
*   **Toolchain:** `Icarus Verilog`, `GTKWave`, `RISC-V GCC`