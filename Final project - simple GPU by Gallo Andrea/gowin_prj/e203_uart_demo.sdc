//Copyright (C)2014-2023 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//GOWIN Version: 1.9.9 Beta-4 Education
//Created Time: 2023-12-28 09:05:32
create_clock -name main_clk -period 37.037 -waveform {0 18.518} [get_ports {clk_in}] -add
create_clock -name jtag_tck -period 100 -waveform {0 50} [get_ports {tck}] -add
