

/****************************************************************
========Oooo=========================================Oooo========
=     Copyright ©2015-2018 Gowin Semiconductor Corporation.     =
=                     All rights reserved.                      =
========Oooo=========================================Oooo========

<File Title>: IP file
<gwModGen version>: 1.8.0Beta
<Series, Device, Package, Speed>: GW2A, GW2A-55, PBGA484
<Created Time>: Thu Jun 14 18:00:03 2018
****************************************************************/

module clk_unit (clkout_rtc, reset, clkin, clkout_system, lock);

output clkout_rtc;
input reset;
input clkin;
output clkout_system;
output lock;
wire lock_sys;
wire lock_rtc;
wire rtc_rst;
wire sys_rst;

wire clkoutp_o;
wire clkoutd_o;
wire clkout_o;
wire clkoutd3_o;
wire gw_gnd;

reg [7:0] lock_rtc_dly =8'h00;

always@(posedge clkout_rtc)
	lock_rtc_dly <= {lock_rtc_dly[6:0],lock_rtc};

assign	rtc_rst = !reset;
assign	sys_rst = !lock_rtc_dly[7];
assign gw_gnd = 1'b0;
assign lock = lock_rtc & lock_sys;

PLL pll_inst_rtc (
    .CLKOUT(clkout_o),
    .LOCK(lock_rtc),
    .CLKOUTP(clkoutp_o),
    .CLKOUTD(clkout_rtc),
    .CLKOUTD3(clkoutd3_o),
    .RESET(rtc_rst),
    .RESET_P(gw_gnd),
    .RESET_I(gw_gnd),
    .RESET_S(gw_gnd),
    .CLKIN(clkin),
    .CLKFB(gw_gnd),
    .FBDSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .IDSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .ODSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .PSDA({gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .DUTYDA({gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FDLY({gw_gnd,gw_gnd,gw_gnd,gw_gnd})
);
//input clock =27MHz, rtc runs at 35.1562kHz
defparam pll_inst_rtc.FCLKIN = "27";
defparam pll_inst_rtc.DYN_IDIV_SEL = "false";
defparam pll_inst_rtc.IDIV_SEL = 5;         //div clk_in = 6, means fref_clk = 4.5MHz
defparam pll_inst_rtc.DYN_FBDIV_SEL = "false";
defparam pll_inst_rtc.FBDIV_SEL = 0;        //fb_div = 1
defparam pll_inst_rtc.DYN_ODIV_SEL = "false";
defparam pll_inst_rtc.ODIV_SEL = 128;       //fvco=128xfin= 576MHz,valid
defparam pll_inst_rtc.PSDA_SEL = "0000";
defparam pll_inst_rtc.DYN_DA_EN = "false";
defparam pll_inst_rtc.DUTYDA_SEL = "1000";
defparam pll_inst_rtc.CLKOUT_FT_DIR = 1'b1;
defparam pll_inst_rtc.CLKOUTP_FT_DIR = 1'b1;
defparam pll_inst_rtc.CLKOUT_DLY_STEP = 0;
defparam pll_inst_rtc.CLKOUTP_DLY_STEP = 0;
defparam pll_inst_rtc.CLKFB_SEL = "internal";
defparam pll_inst_rtc.CLKOUT_BYPASS = "false";
defparam pll_inst_rtc.CLKOUTP_BYPASS = "false";
defparam pll_inst_rtc.CLKOUTD_BYPASS = "false";
defparam pll_inst_rtc.DYN_SDIV_SEL = 128;   //fclkod = 4.5MHz/128 = 35.1562kHz
defparam pll_inst_rtc.CLKOUTD_SRC = "CLKOUT";
defparam pll_inst_rtc.CLKOUTD3_SRC = "CLKOUT";
defparam pll_inst_rtc.DEVICE = "GW2A-55";

PLL pll_inst_system (
    .CLKOUT(clkout_system),
    .LOCK(lock_sys),
    .CLKOUTP(clkoutp_o),
    .CLKOUTD(clkoutd_o),
    .CLKOUTD3(clkoutd3_o),
    .RESET(sys_rst),
    .RESET_P(gw_gnd),
    .RESET_I(gw_gnd),
    .RESET_S(gw_gnd),
    .CLKIN(clkin),
    .CLKFB(gw_gnd),
    .FBDSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .IDSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .ODSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .PSDA({gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .DUTYDA({gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FDLY({gw_gnd,gw_gnd,gw_gnd,gw_gnd})
);


//5MHz
/*
defparam pll_inst_system.FCLKIN = "50";
defparam pll_inst_system.DYN_IDIV_SEL = "false";
defparam pll_inst_system.IDIV_SEL = 9;
defparam pll_inst_system.DYN_FBDIV_SEL = "false";
defparam pll_inst_system.FBDIV_SEL = 0;
defparam pll_inst_system.DYN_ODIV_SEL = "false";
defparam pll_inst_system.ODIV_SEL = 128;
defparam pll_inst_system.PSDA_SEL = "0000";
defparam pll_inst_system.DYN_DA_EN = "true";
defparam pll_inst_system.DUTYDA_SEL = "1000";
defparam pll_inst_system.CLKOUT_FT_DIR = 1'b1;
defparam pll_inst_system.CLKOUTP_FT_DIR = 1'b1;
defparam pll_inst_system.CLKOUT_DLY_STEP = 0;
defparam pll_inst_system.CLKOUTP_DLY_STEP = 0;
defparam pll_inst_system.CLKFB_SEL = "internal";
defparam pll_inst_system.CLKOUT_BYPASS = "false";
defparam pll_inst_system.CLKOUTP_BYPASS = "false";
defparam pll_inst_system.CLKOUTD_BYPASS = "false";
defparam pll_inst_system.DYN_SDIV_SEL = 2;
defparam pll_inst_system.CLKOUTD_SRC = "CLKOUT";
defparam pll_inst_system.CLKOUTD3_SRC = "CLKOUT";
defparam pll_inst_system.DEVICE = "GW2A-55";
*/

//10MHz
/*
defparam pll_inst_system.FCLKIN = "50";
defparam pll_inst_system.DYN_IDIV_SEL = "false";
defparam pll_inst_system.IDIV_SEL = 4;
defparam pll_inst_system.DYN_FBDIV_SEL = "false";
defparam pll_inst_system.FBDIV_SEL = 0;
defparam pll_inst_system.DYN_ODIV_SEL = "false";
defparam pll_inst_system.ODIV_SEL = 128;
defparam pll_inst_system.PSDA_SEL = "0000";
defparam pll_inst_system.DYN_DA_EN = "false";
defparam pll_inst_system.DUTYDA_SEL = "1000";
defparam pll_inst_system.CLKOUT_FT_DIR = 1'b1;
defparam pll_inst_system.CLKOUTP_FT_DIR = 1'b1;
defparam pll_inst_system.CLKOUT_DLY_STEP = 0;
defparam pll_inst_system.CLKOUTP_DLY_STEP = 0;
defparam pll_inst_system.CLKFB_SEL = "internal";
defparam pll_inst_system.CLKOUT_BYPASS = "false";
defparam pll_inst_system.CLKOUTP_BYPASS = "false";
defparam pll_inst_system.CLKOUTD_BYPASS = "false";
defparam pll_inst_system.DYN_SDIV_SEL = 2;
defparam pll_inst_system.CLKOUTD_SRC = "CLKOUT";
defparam pll_inst_system.CLKOUTD3_SRC = "CLKOUT";
defparam pll_inst_system.DEVICE = "GW2A-55";
*/

//18MHz

defparam pll_inst_system.FCLKIN = "27";
defparam pll_inst_system.DYN_IDIV_SEL = "false";
defparam pll_inst_system.IDIV_SEL = 2;              //fref_clk = 27MHz/3= 9.0MHz
defparam pll_inst_system.DYN_FBDIV_SEL = "false";
defparam pll_inst_system.FBDIV_SEL = 1;             //fb_div = 2
defparam pll_inst_system.DYN_ODIV_SEL = "false";
defparam pll_inst_system.ODIV_SEL = 32;             //fvco = fb_div*fref_clk*32 = 576MHz, valid
defparam pll_inst_system.PSDA_SEL = "0000";
defparam pll_inst_system.DYN_DA_EN = "true";
defparam pll_inst_system.DUTYDA_SEL = "1000";
defparam pll_inst_system.CLKOUT_FT_DIR = 1'b1;
defparam pll_inst_system.CLKOUTP_FT_DIR = 1'b1;
defparam pll_inst_system.CLKOUT_DLY_STEP = 0;
defparam pll_inst_system.CLKOUTP_DLY_STEP = 0;
defparam pll_inst_system.CLKFB_SEL = "internal";
defparam pll_inst_system.CLKOUT_BYPASS = "false";
defparam pll_inst_system.CLKOUTP_BYPASS = "false";
defparam pll_inst_system.CLKOUTD_BYPASS = "false";
defparam pll_inst_system.DYN_SDIV_SEL = 2;
defparam pll_inst_system.CLKOUTD_SRC = "CLKOUT";
defparam pll_inst_system.CLKOUTD3_SRC = "CLKOUT";
defparam pll_inst_system.DEVICE = "GW2A-55";


//40MHz
/*
defparam pll_inst_system.FCLKIN = "50";
defparam pll_inst_system.DYN_IDIV_SEL = "false";
defparam pll_inst_system.IDIV_SEL = 4;
defparam pll_inst_system.DYN_FBDIV_SEL = "false";
defparam pll_inst_system.FBDIV_SEL = 3;
defparam pll_inst_system.DYN_ODIV_SEL = "false";
defparam pll_inst_system.ODIV_SEL = 32;
defparam pll_inst_system.PSDA_SEL = "0000";
defparam pll_inst_system.DYN_DA_EN = "false";
defparam pll_inst_system.DUTYDA_SEL = "1000";
defparam pll_inst_system.CLKOUT_FT_DIR = 1'b1;
defparam pll_inst_system.CLKOUTP_FT_DIR = 1'b1;
defparam pll_inst_system.CLKOUT_DLY_STEP = 0;
defparam pll_inst_system.CLKOUTP_DLY_STEP = 0;
defparam pll_inst_system.CLKFB_SEL = "internal";
defparam pll_inst_system.CLKOUT_BYPASS = "false";
defparam pll_inst_system.CLKOUTP_BYPASS = "false";
defparam pll_inst_system.CLKOUTD_BYPASS = "false";
defparam pll_inst_system.DYN_SDIV_SEL = 2;
defparam pll_inst_system.CLKOUTD_SRC = "CLKOUT";
defparam pll_inst_system.CLKOUTD3_SRC = "CLKOUT";
defparam pll_inst_system.DEVICE = "GW2A-55";
*/

endmodule //GW_PLL
