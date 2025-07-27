//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.11.01 Education (64-bit)
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18
//Device Version: C
//Created Time: Thu Jul  3 12:23:44 2025

module Gowin_DPB (douta, doutb, clka, ocea, cea, reseta, wrea, clkb, oceb, ceb, resetb, wreb, ada, dina, adb, dinb);

output [15:0] douta;
output [15:0] doutb;
input clka;
input ocea;
input cea;
input reseta;
input wrea;
input clkb;
input oceb;
input ceb;
input resetb;
input wreb;
input [14:0] ada;
input [15:0] dina;
input [14:0] adb;
input [15:0] dinb;

wire lut_f_0;
wire lut_f_1;
wire lut_f_2;
wire lut_f_3;
wire lut_f_4;
wire lut_f_5;
wire lut_f_6;
wire lut_f_7;
wire lut_f_8;
wire lut_f_9;
wire lut_f_10;
wire lut_f_11;
wire lut_f_12;
wire lut_f_13;
wire lut_f_14;
wire lut_f_15;
wire lut_f_16;
wire lut_f_17;
wire lut_f_18;
wire lut_f_19;
wire [8:0] dpx9b_inst_0_douta_w;
wire [8:0] dpx9b_inst_0_douta;
wire [8:0] dpx9b_inst_0_doutb_w;
wire [8:0] dpx9b_inst_0_doutb;
wire [8:0] dpx9b_inst_1_douta_w;
wire [8:0] dpx9b_inst_1_douta;
wire [8:0] dpx9b_inst_1_doutb_w;
wire [8:0] dpx9b_inst_1_doutb;
wire [8:0] dpx9b_inst_2_douta_w;
wire [8:0] dpx9b_inst_2_douta;
wire [8:0] dpx9b_inst_2_doutb_w;
wire [8:0] dpx9b_inst_2_doutb;
wire [8:0] dpx9b_inst_3_douta_w;
wire [8:0] dpx9b_inst_3_douta;
wire [8:0] dpx9b_inst_3_doutb_w;
wire [8:0] dpx9b_inst_3_doutb;
wire [8:0] dpx9b_inst_4_douta_w;
wire [8:0] dpx9b_inst_4_douta;
wire [8:0] dpx9b_inst_4_doutb_w;
wire [8:0] dpx9b_inst_4_doutb;
wire [8:0] dpx9b_inst_5_douta_w;
wire [8:0] dpx9b_inst_5_douta;
wire [8:0] dpx9b_inst_5_doutb_w;
wire [8:0] dpx9b_inst_5_doutb;
wire [8:0] dpx9b_inst_6_douta_w;
wire [8:0] dpx9b_inst_6_douta;
wire [8:0] dpx9b_inst_6_doutb_w;
wire [8:0] dpx9b_inst_6_doutb;
wire [8:0] dpx9b_inst_7_douta_w;
wire [8:0] dpx9b_inst_7_douta;
wire [8:0] dpx9b_inst_7_doutb_w;
wire [8:0] dpx9b_inst_7_doutb;
wire [14:0] dpb_inst_8_douta_w;
wire [9:9] dpb_inst_8_douta;
wire [14:0] dpb_inst_8_doutb_w;
wire [9:9] dpb_inst_8_doutb;
wire [14:0] dpb_inst_9_douta_w;
wire [10:10] dpb_inst_9_douta;
wire [14:0] dpb_inst_9_doutb_w;
wire [10:10] dpb_inst_9_doutb;
wire [14:0] dpb_inst_10_douta_w;
wire [11:11] dpb_inst_10_douta;
wire [14:0] dpb_inst_10_doutb_w;
wire [11:11] dpb_inst_10_doutb;
wire [14:0] dpb_inst_11_douta_w;
wire [12:12] dpb_inst_11_douta;
wire [14:0] dpb_inst_11_doutb_w;
wire [12:12] dpb_inst_11_doutb;
wire [14:0] dpb_inst_12_douta_w;
wire [13:13] dpb_inst_12_douta;
wire [14:0] dpb_inst_12_doutb_w;
wire [13:13] dpb_inst_12_doutb;
wire [14:0] dpb_inst_13_douta_w;
wire [14:14] dpb_inst_13_douta;
wire [14:0] dpb_inst_13_doutb_w;
wire [14:14] dpb_inst_13_doutb;
wire [14:0] dpb_inst_14_douta_w;
wire [15:15] dpb_inst_14_douta;
wire [14:0] dpb_inst_14_doutb_w;
wire [15:15] dpb_inst_14_doutb;
wire [7:0] dpb_inst_15_douta_w;
wire [7:0] dpb_inst_15_douta;
wire [7:0] dpb_inst_15_doutb_w;
wire [7:0] dpb_inst_15_doutb;
wire [7:0] dpb_inst_16_douta_w;
wire [15:8] dpb_inst_16_douta;
wire [7:0] dpb_inst_16_doutb_w;
wire [15:8] dpb_inst_16_doutb;
wire [15:0] dpb_inst_17_douta;
wire [15:0] dpb_inst_17_doutb;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire dff_q_3;
wire dff_q_4;
wire dff_q_5;
wire dff_q_6;
wire dff_q_7;
wire mux_o_10;
wire mux_o_11;
wire mux_o_12;
wire mux_o_13;
wire mux_o_14;
wire mux_o_15;
wire mux_o_16;
wire mux_o_18;
wire mux_o_31;
wire mux_o_32;
wire mux_o_33;
wire mux_o_34;
wire mux_o_35;
wire mux_o_36;
wire mux_o_37;
wire mux_o_39;
wire mux_o_52;
wire mux_o_53;
wire mux_o_54;
wire mux_o_55;
wire mux_o_56;
wire mux_o_57;
wire mux_o_58;
wire mux_o_60;
wire mux_o_73;
wire mux_o_74;
wire mux_o_75;
wire mux_o_76;
wire mux_o_77;
wire mux_o_78;
wire mux_o_79;
wire mux_o_81;
wire mux_o_94;
wire mux_o_95;
wire mux_o_96;
wire mux_o_97;
wire mux_o_98;
wire mux_o_99;
wire mux_o_100;
wire mux_o_102;
wire mux_o_115;
wire mux_o_116;
wire mux_o_117;
wire mux_o_118;
wire mux_o_119;
wire mux_o_120;
wire mux_o_121;
wire mux_o_123;
wire mux_o_136;
wire mux_o_137;
wire mux_o_138;
wire mux_o_139;
wire mux_o_140;
wire mux_o_141;
wire mux_o_142;
wire mux_o_144;
wire mux_o_157;
wire mux_o_158;
wire mux_o_159;
wire mux_o_160;
wire mux_o_161;
wire mux_o_162;
wire mux_o_163;
wire mux_o_165;
wire mux_o_178;
wire mux_o_179;
wire mux_o_180;
wire mux_o_181;
wire mux_o_182;
wire mux_o_183;
wire mux_o_184;
wire mux_o_186;
wire mux_o_193;
wire mux_o_203;
wire mux_o_213;
wire mux_o_223;
wire mux_o_233;
wire mux_o_243;
wire mux_o_253;
wire mux_o_269;
wire mux_o_270;
wire mux_o_271;
wire mux_o_272;
wire mux_o_273;
wire mux_o_274;
wire mux_o_275;
wire mux_o_277;
wire mux_o_290;
wire mux_o_291;
wire mux_o_292;
wire mux_o_293;
wire mux_o_294;
wire mux_o_295;
wire mux_o_296;
wire mux_o_298;
wire mux_o_311;
wire mux_o_312;
wire mux_o_313;
wire mux_o_314;
wire mux_o_315;
wire mux_o_316;
wire mux_o_317;
wire mux_o_319;
wire mux_o_332;
wire mux_o_333;
wire mux_o_334;
wire mux_o_335;
wire mux_o_336;
wire mux_o_337;
wire mux_o_338;
wire mux_o_340;
wire mux_o_353;
wire mux_o_354;
wire mux_o_355;
wire mux_o_356;
wire mux_o_357;
wire mux_o_358;
wire mux_o_359;
wire mux_o_361;
wire mux_o_374;
wire mux_o_375;
wire mux_o_376;
wire mux_o_377;
wire mux_o_378;
wire mux_o_379;
wire mux_o_380;
wire mux_o_382;
wire mux_o_395;
wire mux_o_396;
wire mux_o_397;
wire mux_o_398;
wire mux_o_399;
wire mux_o_400;
wire mux_o_401;
wire mux_o_403;
wire mux_o_416;
wire mux_o_417;
wire mux_o_418;
wire mux_o_419;
wire mux_o_420;
wire mux_o_421;
wire mux_o_422;
wire mux_o_424;
wire mux_o_437;
wire mux_o_438;
wire mux_o_439;
wire mux_o_440;
wire mux_o_441;
wire mux_o_442;
wire mux_o_443;
wire mux_o_445;
wire mux_o_452;
wire mux_o_462;
wire mux_o_472;
wire mux_o_482;
wire mux_o_492;
wire mux_o_502;
wire mux_o_512;
wire cea_w;
wire ceb_w;
wire gw_vcc;
wire gw_gnd;

assign cea_w = ~wrea & cea;
assign ceb_w = ~wreb & ceb;
assign gw_vcc = 1'b1;
assign gw_gnd = 1'b0;

LUT4 lut_inst_0 (
  .F(lut_f_0),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_0.INIT = 16'h0001;
LUT4 lut_inst_1 (
  .F(lut_f_1),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_1.INIT = 16'h0002;
LUT4 lut_inst_2 (
  .F(lut_f_2),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_2.INIT = 16'h0004;
LUT4 lut_inst_3 (
  .F(lut_f_3),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_3.INIT = 16'h0008;
LUT4 lut_inst_4 (
  .F(lut_f_4),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_4.INIT = 16'h0010;
LUT4 lut_inst_5 (
  .F(lut_f_5),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_5.INIT = 16'h0020;
LUT4 lut_inst_6 (
  .F(lut_f_6),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_6.INIT = 16'h0040;
LUT4 lut_inst_7 (
  .F(lut_f_7),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_7.INIT = 16'h0080;
LUT4 lut_inst_8 (
  .F(lut_f_8),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14])
);
defparam lut_inst_8.INIT = 16'h0100;
LUT5 lut_inst_9 (
  .F(lut_f_9),
  .I0(ada[10]),
  .I1(ada[11]),
  .I2(ada[12]),
  .I3(ada[13]),
  .I4(ada[14])
);
defparam lut_inst_9.INIT = 32'h00040000;
LUT4 lut_inst_10 (
  .F(lut_f_10),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_10.INIT = 16'h0001;
LUT4 lut_inst_11 (
  .F(lut_f_11),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_11.INIT = 16'h0002;
LUT4 lut_inst_12 (
  .F(lut_f_12),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_12.INIT = 16'h0004;
LUT4 lut_inst_13 (
  .F(lut_f_13),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_13.INIT = 16'h0008;
LUT4 lut_inst_14 (
  .F(lut_f_14),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_14.INIT = 16'h0010;
LUT4 lut_inst_15 (
  .F(lut_f_15),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_15.INIT = 16'h0020;
LUT4 lut_inst_16 (
  .F(lut_f_16),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_16.INIT = 16'h0040;
LUT4 lut_inst_17 (
  .F(lut_f_17),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_17.INIT = 16'h0080;
LUT4 lut_inst_18 (
  .F(lut_f_18),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14])
);
defparam lut_inst_18.INIT = 16'h0100;
LUT5 lut_inst_19 (
  .F(lut_f_19),
  .I0(adb[10]),
  .I1(adb[11]),
  .I2(adb[12]),
  .I3(adb[13]),
  .I4(adb[14])
);
defparam lut_inst_19.INIT = 32'h00040000;
DPX9B dpx9b_inst_0 (
    .DOA({dpx9b_inst_0_douta_w[8:0],dpx9b_inst_0_douta[8:0]}),
    .DOB({dpx9b_inst_0_doutb_w[8:0],dpx9b_inst_0_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_10}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_0.READ_MODE0 = 1'b0;
defparam dpx9b_inst_0.READ_MODE1 = 1'b0;
defparam dpx9b_inst_0.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_0.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_0.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_0.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_0.BLK_SEL_0 = 3'b001;
defparam dpx9b_inst_0.BLK_SEL_1 = 3'b001;
defparam dpx9b_inst_0.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_1 (
    .DOA({dpx9b_inst_1_douta_w[8:0],dpx9b_inst_1_douta[8:0]}),
    .DOB({dpx9b_inst_1_doutb_w[8:0],dpx9b_inst_1_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_1}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_11}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_1.READ_MODE0 = 1'b0;
defparam dpx9b_inst_1.READ_MODE1 = 1'b0;
defparam dpx9b_inst_1.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_1.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_1.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_1.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_1.BLK_SEL_0 = 3'b001;
defparam dpx9b_inst_1.BLK_SEL_1 = 3'b001;
defparam dpx9b_inst_1.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_2 (
    .DOA({dpx9b_inst_2_douta_w[8:0],dpx9b_inst_2_douta[8:0]}),
    .DOB({dpx9b_inst_2_doutb_w[8:0],dpx9b_inst_2_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_2}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_12}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_2.READ_MODE0 = 1'b0;
defparam dpx9b_inst_2.READ_MODE1 = 1'b0;
defparam dpx9b_inst_2.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_2.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_2.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_2.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_2.BLK_SEL_0 = 3'b001;
defparam dpx9b_inst_2.BLK_SEL_1 = 3'b001;
defparam dpx9b_inst_2.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_3 (
    .DOA({dpx9b_inst_3_douta_w[8:0],dpx9b_inst_3_douta[8:0]}),
    .DOB({dpx9b_inst_3_doutb_w[8:0],dpx9b_inst_3_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_3}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_13}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_3.READ_MODE0 = 1'b0;
defparam dpx9b_inst_3.READ_MODE1 = 1'b0;
defparam dpx9b_inst_3.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_3.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_3.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_3.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_3.BLK_SEL_0 = 3'b001;
defparam dpx9b_inst_3.BLK_SEL_1 = 3'b001;
defparam dpx9b_inst_3.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_4 (
    .DOA({dpx9b_inst_4_douta_w[8:0],dpx9b_inst_4_douta[8:0]}),
    .DOB({dpx9b_inst_4_doutb_w[8:0],dpx9b_inst_4_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_4}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_14}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_4.READ_MODE0 = 1'b0;
defparam dpx9b_inst_4.READ_MODE1 = 1'b0;
defparam dpx9b_inst_4.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_4.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_4.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_4.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_4.BLK_SEL_0 = 3'b001;
defparam dpx9b_inst_4.BLK_SEL_1 = 3'b001;
defparam dpx9b_inst_4.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_5 (
    .DOA({dpx9b_inst_5_douta_w[8:0],dpx9b_inst_5_douta[8:0]}),
    .DOB({dpx9b_inst_5_doutb_w[8:0],dpx9b_inst_5_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_5}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_15}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_5.READ_MODE0 = 1'b0;
defparam dpx9b_inst_5.READ_MODE1 = 1'b0;
defparam dpx9b_inst_5.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_5.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_5.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_5.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_5.BLK_SEL_0 = 3'b001;
defparam dpx9b_inst_5.BLK_SEL_1 = 3'b001;
defparam dpx9b_inst_5.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_6 (
    .DOA({dpx9b_inst_6_douta_w[8:0],dpx9b_inst_6_douta[8:0]}),
    .DOB({dpx9b_inst_6_doutb_w[8:0],dpx9b_inst_6_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_6}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_16}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_6.READ_MODE0 = 1'b0;
defparam dpx9b_inst_6.READ_MODE1 = 1'b0;
defparam dpx9b_inst_6.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_6.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_6.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_6.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_6.BLK_SEL_0 = 3'b001;
defparam dpx9b_inst_6.BLK_SEL_1 = 3'b001;
defparam dpx9b_inst_6.RESET_MODE = "SYNC";

DPX9B dpx9b_inst_7 (
    .DOA({dpx9b_inst_7_douta_w[8:0],dpx9b_inst_7_douta[8:0]}),
    .DOB({dpx9b_inst_7_doutb_w[8:0],dpx9b_inst_7_doutb[8:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_7}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_17}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[8:0]})
);

defparam dpx9b_inst_7.READ_MODE0 = 1'b0;
defparam dpx9b_inst_7.READ_MODE1 = 1'b0;
defparam dpx9b_inst_7.WRITE_MODE0 = 2'b00;
defparam dpx9b_inst_7.WRITE_MODE1 = 2'b00;
defparam dpx9b_inst_7.BIT_WIDTH_0 = 9;
defparam dpx9b_inst_7.BIT_WIDTH_1 = 9;
defparam dpx9b_inst_7.BLK_SEL_0 = 3'b001;
defparam dpx9b_inst_7.BLK_SEL_1 = 3'b001;
defparam dpx9b_inst_7.RESET_MODE = "SYNC";

DPB dpb_inst_8 (
    .DOA({dpb_inst_8_douta_w[14:0],dpb_inst_8_douta[9]}),
    .DOB({dpb_inst_8_doutb_w[14:0],dpb_inst_8_doutb[9]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[9]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[9]})
);

defparam dpb_inst_8.READ_MODE0 = 1'b0;
defparam dpb_inst_8.READ_MODE1 = 1'b0;
defparam dpb_inst_8.WRITE_MODE0 = 2'b00;
defparam dpb_inst_8.WRITE_MODE1 = 2'b00;
defparam dpb_inst_8.BIT_WIDTH_0 = 1;
defparam dpb_inst_8.BIT_WIDTH_1 = 1;
defparam dpb_inst_8.BLK_SEL_0 = 3'b000;
defparam dpb_inst_8.BLK_SEL_1 = 3'b000;
defparam dpb_inst_8.RESET_MODE = "SYNC";

DPB dpb_inst_9 (
    .DOA({dpb_inst_9_douta_w[14:0],dpb_inst_9_douta[10]}),
    .DOB({dpb_inst_9_doutb_w[14:0],dpb_inst_9_doutb[10]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[10]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[10]})
);

defparam dpb_inst_9.READ_MODE0 = 1'b0;
defparam dpb_inst_9.READ_MODE1 = 1'b0;
defparam dpb_inst_9.WRITE_MODE0 = 2'b00;
defparam dpb_inst_9.WRITE_MODE1 = 2'b00;
defparam dpb_inst_9.BIT_WIDTH_0 = 1;
defparam dpb_inst_9.BIT_WIDTH_1 = 1;
defparam dpb_inst_9.BLK_SEL_0 = 3'b000;
defparam dpb_inst_9.BLK_SEL_1 = 3'b000;
defparam dpb_inst_9.RESET_MODE = "SYNC";

DPB dpb_inst_10 (
    .DOA({dpb_inst_10_douta_w[14:0],dpb_inst_10_douta[11]}),
    .DOB({dpb_inst_10_doutb_w[14:0],dpb_inst_10_doutb[11]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[11]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[11]})
);

defparam dpb_inst_10.READ_MODE0 = 1'b0;
defparam dpb_inst_10.READ_MODE1 = 1'b0;
defparam dpb_inst_10.WRITE_MODE0 = 2'b00;
defparam dpb_inst_10.WRITE_MODE1 = 2'b00;
defparam dpb_inst_10.BIT_WIDTH_0 = 1;
defparam dpb_inst_10.BIT_WIDTH_1 = 1;
defparam dpb_inst_10.BLK_SEL_0 = 3'b000;
defparam dpb_inst_10.BLK_SEL_1 = 3'b000;
defparam dpb_inst_10.RESET_MODE = "SYNC";

DPB dpb_inst_11 (
    .DOA({dpb_inst_11_douta_w[14:0],dpb_inst_11_douta[12]}),
    .DOB({dpb_inst_11_doutb_w[14:0],dpb_inst_11_doutb[12]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[12]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[12]})
);

defparam dpb_inst_11.READ_MODE0 = 1'b0;
defparam dpb_inst_11.READ_MODE1 = 1'b0;
defparam dpb_inst_11.WRITE_MODE0 = 2'b00;
defparam dpb_inst_11.WRITE_MODE1 = 2'b00;
defparam dpb_inst_11.BIT_WIDTH_0 = 1;
defparam dpb_inst_11.BIT_WIDTH_1 = 1;
defparam dpb_inst_11.BLK_SEL_0 = 3'b000;
defparam dpb_inst_11.BLK_SEL_1 = 3'b000;
defparam dpb_inst_11.RESET_MODE = "SYNC";

DPB dpb_inst_12 (
    .DOA({dpb_inst_12_douta_w[14:0],dpb_inst_12_douta[13]}),
    .DOB({dpb_inst_12_doutb_w[14:0],dpb_inst_12_doutb[13]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[13]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[13]})
);

defparam dpb_inst_12.READ_MODE0 = 1'b0;
defparam dpb_inst_12.READ_MODE1 = 1'b0;
defparam dpb_inst_12.WRITE_MODE0 = 2'b00;
defparam dpb_inst_12.WRITE_MODE1 = 2'b00;
defparam dpb_inst_12.BIT_WIDTH_0 = 1;
defparam dpb_inst_12.BIT_WIDTH_1 = 1;
defparam dpb_inst_12.BLK_SEL_0 = 3'b000;
defparam dpb_inst_12.BLK_SEL_1 = 3'b000;
defparam dpb_inst_12.RESET_MODE = "SYNC";

DPB dpb_inst_13 (
    .DOA({dpb_inst_13_douta_w[14:0],dpb_inst_13_douta[14]}),
    .DOB({dpb_inst_13_doutb_w[14:0],dpb_inst_13_doutb[14]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[14]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[14]})
);

defparam dpb_inst_13.READ_MODE0 = 1'b0;
defparam dpb_inst_13.READ_MODE1 = 1'b0;
defparam dpb_inst_13.WRITE_MODE0 = 2'b00;
defparam dpb_inst_13.WRITE_MODE1 = 2'b00;
defparam dpb_inst_13.BIT_WIDTH_0 = 1;
defparam dpb_inst_13.BIT_WIDTH_1 = 1;
defparam dpb_inst_13.BLK_SEL_0 = 3'b000;
defparam dpb_inst_13.BLK_SEL_1 = 3'b000;
defparam dpb_inst_13.RESET_MODE = "SYNC";

DPB dpb_inst_14 (
    .DOA({dpb_inst_14_douta_w[14:0],dpb_inst_14_douta[15]}),
    .DOB({dpb_inst_14_doutb_w[14:0],dpb_inst_14_doutb[15]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[14]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[15]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[15]})
);

defparam dpb_inst_14.READ_MODE0 = 1'b0;
defparam dpb_inst_14.READ_MODE1 = 1'b0;
defparam dpb_inst_14.WRITE_MODE0 = 2'b00;
defparam dpb_inst_14.WRITE_MODE1 = 2'b00;
defparam dpb_inst_14.BIT_WIDTH_0 = 1;
defparam dpb_inst_14.BIT_WIDTH_1 = 1;
defparam dpb_inst_14.BLK_SEL_0 = 3'b000;
defparam dpb_inst_14.BLK_SEL_1 = 3'b000;
defparam dpb_inst_14.RESET_MODE = "SYNC";

DPB dpb_inst_15 (
    .DOA({dpb_inst_15_douta_w[7:0],dpb_inst_15_douta[7:0]}),
    .DOB({dpb_inst_15_doutb_w[7:0],dpb_inst_15_doutb[7:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_8}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_18}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7:0]})
);

defparam dpb_inst_15.READ_MODE0 = 1'b0;
defparam dpb_inst_15.READ_MODE1 = 1'b0;
defparam dpb_inst_15.WRITE_MODE0 = 2'b00;
defparam dpb_inst_15.WRITE_MODE1 = 2'b00;
defparam dpb_inst_15.BIT_WIDTH_0 = 8;
defparam dpb_inst_15.BIT_WIDTH_1 = 8;
defparam dpb_inst_15.BLK_SEL_0 = 3'b001;
defparam dpb_inst_15.BLK_SEL_1 = 3'b001;
defparam dpb_inst_15.RESET_MODE = "SYNC";

DPB dpb_inst_16 (
    .DOA({dpb_inst_16_douta_w[7:0],dpb_inst_16_douta[15:8]}),
    .DOB({dpb_inst_16_doutb_w[7:0],dpb_inst_16_doutb[15:8]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_8}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_18}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[15:8]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[15:8]})
);

defparam dpb_inst_16.READ_MODE0 = 1'b0;
defparam dpb_inst_16.READ_MODE1 = 1'b0;
defparam dpb_inst_16.WRITE_MODE0 = 2'b00;
defparam dpb_inst_16.WRITE_MODE1 = 2'b00;
defparam dpb_inst_16.BIT_WIDTH_0 = 8;
defparam dpb_inst_16.BIT_WIDTH_1 = 8;
defparam dpb_inst_16.BLK_SEL_0 = 3'b001;
defparam dpb_inst_16.BLK_SEL_1 = 3'b001;
defparam dpb_inst_16.RESET_MODE = "SYNC";

DPB dpb_inst_17 (
    .DOA(dpb_inst_17_douta[15:0]),
    .DOB(dpb_inst_17_doutb[15:0]),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_9}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_19}),
    .ADA({ada[9:0],gw_gnd,gw_gnd,gw_vcc,gw_vcc}),
    .DIA(dina[15:0]),
    .ADB({adb[9:0],gw_gnd,gw_gnd,gw_vcc,gw_vcc}),
    .DIB(dinb[15:0])
);

defparam dpb_inst_17.READ_MODE0 = 1'b0;
defparam dpb_inst_17.READ_MODE1 = 1'b0;
defparam dpb_inst_17.WRITE_MODE0 = 2'b00;
defparam dpb_inst_17.WRITE_MODE1 = 2'b00;
defparam dpb_inst_17.BIT_WIDTH_0 = 16;
defparam dpb_inst_17.BIT_WIDTH_1 = 16;
defparam dpb_inst_17.BLK_SEL_0 = 3'b001;
defparam dpb_inst_17.BLK_SEL_1 = 3'b001;
defparam dpb_inst_17.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(ada[14]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(ada[13]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_2 (
  .Q(dff_q_2),
  .D(ada[12]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_3 (
  .Q(dff_q_3),
  .D(ada[11]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_4 (
  .Q(dff_q_4),
  .D(adb[14]),
  .CLK(clkb),
  .CE(ceb_w)
);
DFFE dff_inst_5 (
  .Q(dff_q_5),
  .D(adb[13]),
  .CLK(clkb),
  .CE(ceb_w)
);
DFFE dff_inst_6 (
  .Q(dff_q_6),
  .D(adb[12]),
  .CLK(clkb),
  .CE(ceb_w)
);
DFFE dff_inst_7 (
  .Q(dff_q_7),
  .D(adb[11]),
  .CLK(clkb),
  .CE(ceb_w)
);
MUX2 mux_inst_10 (
  .O(mux_o_10),
  .I0(dpx9b_inst_0_douta[0]),
  .I1(dpx9b_inst_1_douta[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_11 (
  .O(mux_o_11),
  .I0(dpx9b_inst_2_douta[0]),
  .I1(dpx9b_inst_3_douta[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(dpx9b_inst_4_douta[0]),
  .I1(dpx9b_inst_5_douta[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_13 (
  .O(mux_o_13),
  .I0(dpx9b_inst_6_douta[0]),
  .I1(dpx9b_inst_7_douta[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_14 (
  .O(mux_o_14),
  .I0(dpb_inst_15_douta[0]),
  .I1(dpb_inst_17_douta[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_15 (
  .O(mux_o_15),
  .I0(mux_o_10),
  .I1(mux_o_11),
  .S0(dff_q_2)
);
MUX2 mux_inst_16 (
  .O(mux_o_16),
  .I0(mux_o_12),
  .I1(mux_o_13),
  .S0(dff_q_2)
);
MUX2 mux_inst_18 (
  .O(mux_o_18),
  .I0(mux_o_15),
  .I1(mux_o_16),
  .S0(dff_q_1)
);
MUX2 mux_inst_20 (
  .O(douta[0]),
  .I0(mux_o_18),
  .I1(mux_o_14),
  .S0(dff_q_0)
);
MUX2 mux_inst_31 (
  .O(mux_o_31),
  .I0(dpx9b_inst_0_douta[1]),
  .I1(dpx9b_inst_1_douta[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_32 (
  .O(mux_o_32),
  .I0(dpx9b_inst_2_douta[1]),
  .I1(dpx9b_inst_3_douta[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_33 (
  .O(mux_o_33),
  .I0(dpx9b_inst_4_douta[1]),
  .I1(dpx9b_inst_5_douta[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_34 (
  .O(mux_o_34),
  .I0(dpx9b_inst_6_douta[1]),
  .I1(dpx9b_inst_7_douta[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_35 (
  .O(mux_o_35),
  .I0(dpb_inst_15_douta[1]),
  .I1(dpb_inst_17_douta[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(mux_o_31),
  .I1(mux_o_32),
  .S0(dff_q_2)
);
MUX2 mux_inst_37 (
  .O(mux_o_37),
  .I0(mux_o_33),
  .I1(mux_o_34),
  .S0(dff_q_2)
);
MUX2 mux_inst_39 (
  .O(mux_o_39),
  .I0(mux_o_36),
  .I1(mux_o_37),
  .S0(dff_q_1)
);
MUX2 mux_inst_41 (
  .O(douta[1]),
  .I0(mux_o_39),
  .I1(mux_o_35),
  .S0(dff_q_0)
);
MUX2 mux_inst_52 (
  .O(mux_o_52),
  .I0(dpx9b_inst_0_douta[2]),
  .I1(dpx9b_inst_1_douta[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_53 (
  .O(mux_o_53),
  .I0(dpx9b_inst_2_douta[2]),
  .I1(dpx9b_inst_3_douta[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_54 (
  .O(mux_o_54),
  .I0(dpx9b_inst_4_douta[2]),
  .I1(dpx9b_inst_5_douta[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_55 (
  .O(mux_o_55),
  .I0(dpx9b_inst_6_douta[2]),
  .I1(dpx9b_inst_7_douta[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_56 (
  .O(mux_o_56),
  .I0(dpb_inst_15_douta[2]),
  .I1(dpb_inst_17_douta[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_57 (
  .O(mux_o_57),
  .I0(mux_o_52),
  .I1(mux_o_53),
  .S0(dff_q_2)
);
MUX2 mux_inst_58 (
  .O(mux_o_58),
  .I0(mux_o_54),
  .I1(mux_o_55),
  .S0(dff_q_2)
);
MUX2 mux_inst_60 (
  .O(mux_o_60),
  .I0(mux_o_57),
  .I1(mux_o_58),
  .S0(dff_q_1)
);
MUX2 mux_inst_62 (
  .O(douta[2]),
  .I0(mux_o_60),
  .I1(mux_o_56),
  .S0(dff_q_0)
);
MUX2 mux_inst_73 (
  .O(mux_o_73),
  .I0(dpx9b_inst_0_douta[3]),
  .I1(dpx9b_inst_1_douta[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_74 (
  .O(mux_o_74),
  .I0(dpx9b_inst_2_douta[3]),
  .I1(dpx9b_inst_3_douta[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_75 (
  .O(mux_o_75),
  .I0(dpx9b_inst_4_douta[3]),
  .I1(dpx9b_inst_5_douta[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_76 (
  .O(mux_o_76),
  .I0(dpx9b_inst_6_douta[3]),
  .I1(dpx9b_inst_7_douta[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_77 (
  .O(mux_o_77),
  .I0(dpb_inst_15_douta[3]),
  .I1(dpb_inst_17_douta[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_78 (
  .O(mux_o_78),
  .I0(mux_o_73),
  .I1(mux_o_74),
  .S0(dff_q_2)
);
MUX2 mux_inst_79 (
  .O(mux_o_79),
  .I0(mux_o_75),
  .I1(mux_o_76),
  .S0(dff_q_2)
);
MUX2 mux_inst_81 (
  .O(mux_o_81),
  .I0(mux_o_78),
  .I1(mux_o_79),
  .S0(dff_q_1)
);
MUX2 mux_inst_83 (
  .O(douta[3]),
  .I0(mux_o_81),
  .I1(mux_o_77),
  .S0(dff_q_0)
);
MUX2 mux_inst_94 (
  .O(mux_o_94),
  .I0(dpx9b_inst_0_douta[4]),
  .I1(dpx9b_inst_1_douta[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_95 (
  .O(mux_o_95),
  .I0(dpx9b_inst_2_douta[4]),
  .I1(dpx9b_inst_3_douta[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_96 (
  .O(mux_o_96),
  .I0(dpx9b_inst_4_douta[4]),
  .I1(dpx9b_inst_5_douta[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_97 (
  .O(mux_o_97),
  .I0(dpx9b_inst_6_douta[4]),
  .I1(dpx9b_inst_7_douta[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_98 (
  .O(mux_o_98),
  .I0(dpb_inst_15_douta[4]),
  .I1(dpb_inst_17_douta[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_99 (
  .O(mux_o_99),
  .I0(mux_o_94),
  .I1(mux_o_95),
  .S0(dff_q_2)
);
MUX2 mux_inst_100 (
  .O(mux_o_100),
  .I0(mux_o_96),
  .I1(mux_o_97),
  .S0(dff_q_2)
);
MUX2 mux_inst_102 (
  .O(mux_o_102),
  .I0(mux_o_99),
  .I1(mux_o_100),
  .S0(dff_q_1)
);
MUX2 mux_inst_104 (
  .O(douta[4]),
  .I0(mux_o_102),
  .I1(mux_o_98),
  .S0(dff_q_0)
);
MUX2 mux_inst_115 (
  .O(mux_o_115),
  .I0(dpx9b_inst_0_douta[5]),
  .I1(dpx9b_inst_1_douta[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_116 (
  .O(mux_o_116),
  .I0(dpx9b_inst_2_douta[5]),
  .I1(dpx9b_inst_3_douta[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_117 (
  .O(mux_o_117),
  .I0(dpx9b_inst_4_douta[5]),
  .I1(dpx9b_inst_5_douta[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_118 (
  .O(mux_o_118),
  .I0(dpx9b_inst_6_douta[5]),
  .I1(dpx9b_inst_7_douta[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_119 (
  .O(mux_o_119),
  .I0(dpb_inst_15_douta[5]),
  .I1(dpb_inst_17_douta[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_120 (
  .O(mux_o_120),
  .I0(mux_o_115),
  .I1(mux_o_116),
  .S0(dff_q_2)
);
MUX2 mux_inst_121 (
  .O(mux_o_121),
  .I0(mux_o_117),
  .I1(mux_o_118),
  .S0(dff_q_2)
);
MUX2 mux_inst_123 (
  .O(mux_o_123),
  .I0(mux_o_120),
  .I1(mux_o_121),
  .S0(dff_q_1)
);
MUX2 mux_inst_125 (
  .O(douta[5]),
  .I0(mux_o_123),
  .I1(mux_o_119),
  .S0(dff_q_0)
);
MUX2 mux_inst_136 (
  .O(mux_o_136),
  .I0(dpx9b_inst_0_douta[6]),
  .I1(dpx9b_inst_1_douta[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_137 (
  .O(mux_o_137),
  .I0(dpx9b_inst_2_douta[6]),
  .I1(dpx9b_inst_3_douta[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_138 (
  .O(mux_o_138),
  .I0(dpx9b_inst_4_douta[6]),
  .I1(dpx9b_inst_5_douta[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_139 (
  .O(mux_o_139),
  .I0(dpx9b_inst_6_douta[6]),
  .I1(dpx9b_inst_7_douta[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_140 (
  .O(mux_o_140),
  .I0(dpb_inst_15_douta[6]),
  .I1(dpb_inst_17_douta[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_141 (
  .O(mux_o_141),
  .I0(mux_o_136),
  .I1(mux_o_137),
  .S0(dff_q_2)
);
MUX2 mux_inst_142 (
  .O(mux_o_142),
  .I0(mux_o_138),
  .I1(mux_o_139),
  .S0(dff_q_2)
);
MUX2 mux_inst_144 (
  .O(mux_o_144),
  .I0(mux_o_141),
  .I1(mux_o_142),
  .S0(dff_q_1)
);
MUX2 mux_inst_146 (
  .O(douta[6]),
  .I0(mux_o_144),
  .I1(mux_o_140),
  .S0(dff_q_0)
);
MUX2 mux_inst_157 (
  .O(mux_o_157),
  .I0(dpx9b_inst_0_douta[7]),
  .I1(dpx9b_inst_1_douta[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_158 (
  .O(mux_o_158),
  .I0(dpx9b_inst_2_douta[7]),
  .I1(dpx9b_inst_3_douta[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_159 (
  .O(mux_o_159),
  .I0(dpx9b_inst_4_douta[7]),
  .I1(dpx9b_inst_5_douta[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_160 (
  .O(mux_o_160),
  .I0(dpx9b_inst_6_douta[7]),
  .I1(dpx9b_inst_7_douta[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_161 (
  .O(mux_o_161),
  .I0(dpb_inst_15_douta[7]),
  .I1(dpb_inst_17_douta[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_162 (
  .O(mux_o_162),
  .I0(mux_o_157),
  .I1(mux_o_158),
  .S0(dff_q_2)
);
MUX2 mux_inst_163 (
  .O(mux_o_163),
  .I0(mux_o_159),
  .I1(mux_o_160),
  .S0(dff_q_2)
);
MUX2 mux_inst_165 (
  .O(mux_o_165),
  .I0(mux_o_162),
  .I1(mux_o_163),
  .S0(dff_q_1)
);
MUX2 mux_inst_167 (
  .O(douta[7]),
  .I0(mux_o_165),
  .I1(mux_o_161),
  .S0(dff_q_0)
);
MUX2 mux_inst_178 (
  .O(mux_o_178),
  .I0(dpx9b_inst_0_douta[8]),
  .I1(dpx9b_inst_1_douta[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_179 (
  .O(mux_o_179),
  .I0(dpx9b_inst_2_douta[8]),
  .I1(dpx9b_inst_3_douta[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_180 (
  .O(mux_o_180),
  .I0(dpx9b_inst_4_douta[8]),
  .I1(dpx9b_inst_5_douta[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_181 (
  .O(mux_o_181),
  .I0(dpx9b_inst_6_douta[8]),
  .I1(dpx9b_inst_7_douta[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_182 (
  .O(mux_o_182),
  .I0(dpb_inst_16_douta[8]),
  .I1(dpb_inst_17_douta[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_183 (
  .O(mux_o_183),
  .I0(mux_o_178),
  .I1(mux_o_179),
  .S0(dff_q_2)
);
MUX2 mux_inst_184 (
  .O(mux_o_184),
  .I0(mux_o_180),
  .I1(mux_o_181),
  .S0(dff_q_2)
);
MUX2 mux_inst_186 (
  .O(mux_o_186),
  .I0(mux_o_183),
  .I1(mux_o_184),
  .S0(dff_q_1)
);
MUX2 mux_inst_188 (
  .O(douta[8]),
  .I0(mux_o_186),
  .I1(mux_o_182),
  .S0(dff_q_0)
);
MUX2 mux_inst_193 (
  .O(mux_o_193),
  .I0(dpb_inst_16_douta[9]),
  .I1(dpb_inst_17_douta[9]),
  .S0(dff_q_3)
);
MUX2 mux_inst_198 (
  .O(douta[9]),
  .I0(dpb_inst_8_douta[9]),
  .I1(mux_o_193),
  .S0(dff_q_0)
);
MUX2 mux_inst_203 (
  .O(mux_o_203),
  .I0(dpb_inst_16_douta[10]),
  .I1(dpb_inst_17_douta[10]),
  .S0(dff_q_3)
);
MUX2 mux_inst_208 (
  .O(douta[10]),
  .I0(dpb_inst_9_douta[10]),
  .I1(mux_o_203),
  .S0(dff_q_0)
);
MUX2 mux_inst_213 (
  .O(mux_o_213),
  .I0(dpb_inst_16_douta[11]),
  .I1(dpb_inst_17_douta[11]),
  .S0(dff_q_3)
);
MUX2 mux_inst_218 (
  .O(douta[11]),
  .I0(dpb_inst_10_douta[11]),
  .I1(mux_o_213),
  .S0(dff_q_0)
);
MUX2 mux_inst_223 (
  .O(mux_o_223),
  .I0(dpb_inst_16_douta[12]),
  .I1(dpb_inst_17_douta[12]),
  .S0(dff_q_3)
);
MUX2 mux_inst_228 (
  .O(douta[12]),
  .I0(dpb_inst_11_douta[12]),
  .I1(mux_o_223),
  .S0(dff_q_0)
);
MUX2 mux_inst_233 (
  .O(mux_o_233),
  .I0(dpb_inst_16_douta[13]),
  .I1(dpb_inst_17_douta[13]),
  .S0(dff_q_3)
);
MUX2 mux_inst_238 (
  .O(douta[13]),
  .I0(dpb_inst_12_douta[13]),
  .I1(mux_o_233),
  .S0(dff_q_0)
);
MUX2 mux_inst_243 (
  .O(mux_o_243),
  .I0(dpb_inst_16_douta[14]),
  .I1(dpb_inst_17_douta[14]),
  .S0(dff_q_3)
);
MUX2 mux_inst_248 (
  .O(douta[14]),
  .I0(dpb_inst_13_douta[14]),
  .I1(mux_o_243),
  .S0(dff_q_0)
);
MUX2 mux_inst_253 (
  .O(mux_o_253),
  .I0(dpb_inst_16_douta[15]),
  .I1(dpb_inst_17_douta[15]),
  .S0(dff_q_3)
);
MUX2 mux_inst_258 (
  .O(douta[15]),
  .I0(dpb_inst_14_douta[15]),
  .I1(mux_o_253),
  .S0(dff_q_0)
);
MUX2 mux_inst_269 (
  .O(mux_o_269),
  .I0(dpx9b_inst_0_doutb[0]),
  .I1(dpx9b_inst_1_doutb[0]),
  .S0(dff_q_7)
);
MUX2 mux_inst_270 (
  .O(mux_o_270),
  .I0(dpx9b_inst_2_doutb[0]),
  .I1(dpx9b_inst_3_doutb[0]),
  .S0(dff_q_7)
);
MUX2 mux_inst_271 (
  .O(mux_o_271),
  .I0(dpx9b_inst_4_doutb[0]),
  .I1(dpx9b_inst_5_doutb[0]),
  .S0(dff_q_7)
);
MUX2 mux_inst_272 (
  .O(mux_o_272),
  .I0(dpx9b_inst_6_doutb[0]),
  .I1(dpx9b_inst_7_doutb[0]),
  .S0(dff_q_7)
);
MUX2 mux_inst_273 (
  .O(mux_o_273),
  .I0(dpb_inst_15_doutb[0]),
  .I1(dpb_inst_17_doutb[0]),
  .S0(dff_q_7)
);
MUX2 mux_inst_274 (
  .O(mux_o_274),
  .I0(mux_o_269),
  .I1(mux_o_270),
  .S0(dff_q_6)
);
MUX2 mux_inst_275 (
  .O(mux_o_275),
  .I0(mux_o_271),
  .I1(mux_o_272),
  .S0(dff_q_6)
);
MUX2 mux_inst_277 (
  .O(mux_o_277),
  .I0(mux_o_274),
  .I1(mux_o_275),
  .S0(dff_q_5)
);
MUX2 mux_inst_279 (
  .O(doutb[0]),
  .I0(mux_o_277),
  .I1(mux_o_273),
  .S0(dff_q_4)
);
MUX2 mux_inst_290 (
  .O(mux_o_290),
  .I0(dpx9b_inst_0_doutb[1]),
  .I1(dpx9b_inst_1_doutb[1]),
  .S0(dff_q_7)
);
MUX2 mux_inst_291 (
  .O(mux_o_291),
  .I0(dpx9b_inst_2_doutb[1]),
  .I1(dpx9b_inst_3_doutb[1]),
  .S0(dff_q_7)
);
MUX2 mux_inst_292 (
  .O(mux_o_292),
  .I0(dpx9b_inst_4_doutb[1]),
  .I1(dpx9b_inst_5_doutb[1]),
  .S0(dff_q_7)
);
MUX2 mux_inst_293 (
  .O(mux_o_293),
  .I0(dpx9b_inst_6_doutb[1]),
  .I1(dpx9b_inst_7_doutb[1]),
  .S0(dff_q_7)
);
MUX2 mux_inst_294 (
  .O(mux_o_294),
  .I0(dpb_inst_15_doutb[1]),
  .I1(dpb_inst_17_doutb[1]),
  .S0(dff_q_7)
);
MUX2 mux_inst_295 (
  .O(mux_o_295),
  .I0(mux_o_290),
  .I1(mux_o_291),
  .S0(dff_q_6)
);
MUX2 mux_inst_296 (
  .O(mux_o_296),
  .I0(mux_o_292),
  .I1(mux_o_293),
  .S0(dff_q_6)
);
MUX2 mux_inst_298 (
  .O(mux_o_298),
  .I0(mux_o_295),
  .I1(mux_o_296),
  .S0(dff_q_5)
);
MUX2 mux_inst_300 (
  .O(doutb[1]),
  .I0(mux_o_298),
  .I1(mux_o_294),
  .S0(dff_q_4)
);
MUX2 mux_inst_311 (
  .O(mux_o_311),
  .I0(dpx9b_inst_0_doutb[2]),
  .I1(dpx9b_inst_1_doutb[2]),
  .S0(dff_q_7)
);
MUX2 mux_inst_312 (
  .O(mux_o_312),
  .I0(dpx9b_inst_2_doutb[2]),
  .I1(dpx9b_inst_3_doutb[2]),
  .S0(dff_q_7)
);
MUX2 mux_inst_313 (
  .O(mux_o_313),
  .I0(dpx9b_inst_4_doutb[2]),
  .I1(dpx9b_inst_5_doutb[2]),
  .S0(dff_q_7)
);
MUX2 mux_inst_314 (
  .O(mux_o_314),
  .I0(dpx9b_inst_6_doutb[2]),
  .I1(dpx9b_inst_7_doutb[2]),
  .S0(dff_q_7)
);
MUX2 mux_inst_315 (
  .O(mux_o_315),
  .I0(dpb_inst_15_doutb[2]),
  .I1(dpb_inst_17_doutb[2]),
  .S0(dff_q_7)
);
MUX2 mux_inst_316 (
  .O(mux_o_316),
  .I0(mux_o_311),
  .I1(mux_o_312),
  .S0(dff_q_6)
);
MUX2 mux_inst_317 (
  .O(mux_o_317),
  .I0(mux_o_313),
  .I1(mux_o_314),
  .S0(dff_q_6)
);
MUX2 mux_inst_319 (
  .O(mux_o_319),
  .I0(mux_o_316),
  .I1(mux_o_317),
  .S0(dff_q_5)
);
MUX2 mux_inst_321 (
  .O(doutb[2]),
  .I0(mux_o_319),
  .I1(mux_o_315),
  .S0(dff_q_4)
);
MUX2 mux_inst_332 (
  .O(mux_o_332),
  .I0(dpx9b_inst_0_doutb[3]),
  .I1(dpx9b_inst_1_doutb[3]),
  .S0(dff_q_7)
);
MUX2 mux_inst_333 (
  .O(mux_o_333),
  .I0(dpx9b_inst_2_doutb[3]),
  .I1(dpx9b_inst_3_doutb[3]),
  .S0(dff_q_7)
);
MUX2 mux_inst_334 (
  .O(mux_o_334),
  .I0(dpx9b_inst_4_doutb[3]),
  .I1(dpx9b_inst_5_doutb[3]),
  .S0(dff_q_7)
);
MUX2 mux_inst_335 (
  .O(mux_o_335),
  .I0(dpx9b_inst_6_doutb[3]),
  .I1(dpx9b_inst_7_doutb[3]),
  .S0(dff_q_7)
);
MUX2 mux_inst_336 (
  .O(mux_o_336),
  .I0(dpb_inst_15_doutb[3]),
  .I1(dpb_inst_17_doutb[3]),
  .S0(dff_q_7)
);
MUX2 mux_inst_337 (
  .O(mux_o_337),
  .I0(mux_o_332),
  .I1(mux_o_333),
  .S0(dff_q_6)
);
MUX2 mux_inst_338 (
  .O(mux_o_338),
  .I0(mux_o_334),
  .I1(mux_o_335),
  .S0(dff_q_6)
);
MUX2 mux_inst_340 (
  .O(mux_o_340),
  .I0(mux_o_337),
  .I1(mux_o_338),
  .S0(dff_q_5)
);
MUX2 mux_inst_342 (
  .O(doutb[3]),
  .I0(mux_o_340),
  .I1(mux_o_336),
  .S0(dff_q_4)
);
MUX2 mux_inst_353 (
  .O(mux_o_353),
  .I0(dpx9b_inst_0_doutb[4]),
  .I1(dpx9b_inst_1_doutb[4]),
  .S0(dff_q_7)
);
MUX2 mux_inst_354 (
  .O(mux_o_354),
  .I0(dpx9b_inst_2_doutb[4]),
  .I1(dpx9b_inst_3_doutb[4]),
  .S0(dff_q_7)
);
MUX2 mux_inst_355 (
  .O(mux_o_355),
  .I0(dpx9b_inst_4_doutb[4]),
  .I1(dpx9b_inst_5_doutb[4]),
  .S0(dff_q_7)
);
MUX2 mux_inst_356 (
  .O(mux_o_356),
  .I0(dpx9b_inst_6_doutb[4]),
  .I1(dpx9b_inst_7_doutb[4]),
  .S0(dff_q_7)
);
MUX2 mux_inst_357 (
  .O(mux_o_357),
  .I0(dpb_inst_15_doutb[4]),
  .I1(dpb_inst_17_doutb[4]),
  .S0(dff_q_7)
);
MUX2 mux_inst_358 (
  .O(mux_o_358),
  .I0(mux_o_353),
  .I1(mux_o_354),
  .S0(dff_q_6)
);
MUX2 mux_inst_359 (
  .O(mux_o_359),
  .I0(mux_o_355),
  .I1(mux_o_356),
  .S0(dff_q_6)
);
MUX2 mux_inst_361 (
  .O(mux_o_361),
  .I0(mux_o_358),
  .I1(mux_o_359),
  .S0(dff_q_5)
);
MUX2 mux_inst_363 (
  .O(doutb[4]),
  .I0(mux_o_361),
  .I1(mux_o_357),
  .S0(dff_q_4)
);
MUX2 mux_inst_374 (
  .O(mux_o_374),
  .I0(dpx9b_inst_0_doutb[5]),
  .I1(dpx9b_inst_1_doutb[5]),
  .S0(dff_q_7)
);
MUX2 mux_inst_375 (
  .O(mux_o_375),
  .I0(dpx9b_inst_2_doutb[5]),
  .I1(dpx9b_inst_3_doutb[5]),
  .S0(dff_q_7)
);
MUX2 mux_inst_376 (
  .O(mux_o_376),
  .I0(dpx9b_inst_4_doutb[5]),
  .I1(dpx9b_inst_5_doutb[5]),
  .S0(dff_q_7)
);
MUX2 mux_inst_377 (
  .O(mux_o_377),
  .I0(dpx9b_inst_6_doutb[5]),
  .I1(dpx9b_inst_7_doutb[5]),
  .S0(dff_q_7)
);
MUX2 mux_inst_378 (
  .O(mux_o_378),
  .I0(dpb_inst_15_doutb[5]),
  .I1(dpb_inst_17_doutb[5]),
  .S0(dff_q_7)
);
MUX2 mux_inst_379 (
  .O(mux_o_379),
  .I0(mux_o_374),
  .I1(mux_o_375),
  .S0(dff_q_6)
);
MUX2 mux_inst_380 (
  .O(mux_o_380),
  .I0(mux_o_376),
  .I1(mux_o_377),
  .S0(dff_q_6)
);
MUX2 mux_inst_382 (
  .O(mux_o_382),
  .I0(mux_o_379),
  .I1(mux_o_380),
  .S0(dff_q_5)
);
MUX2 mux_inst_384 (
  .O(doutb[5]),
  .I0(mux_o_382),
  .I1(mux_o_378),
  .S0(dff_q_4)
);
MUX2 mux_inst_395 (
  .O(mux_o_395),
  .I0(dpx9b_inst_0_doutb[6]),
  .I1(dpx9b_inst_1_doutb[6]),
  .S0(dff_q_7)
);
MUX2 mux_inst_396 (
  .O(mux_o_396),
  .I0(dpx9b_inst_2_doutb[6]),
  .I1(dpx9b_inst_3_doutb[6]),
  .S0(dff_q_7)
);
MUX2 mux_inst_397 (
  .O(mux_o_397),
  .I0(dpx9b_inst_4_doutb[6]),
  .I1(dpx9b_inst_5_doutb[6]),
  .S0(dff_q_7)
);
MUX2 mux_inst_398 (
  .O(mux_o_398),
  .I0(dpx9b_inst_6_doutb[6]),
  .I1(dpx9b_inst_7_doutb[6]),
  .S0(dff_q_7)
);
MUX2 mux_inst_399 (
  .O(mux_o_399),
  .I0(dpb_inst_15_doutb[6]),
  .I1(dpb_inst_17_doutb[6]),
  .S0(dff_q_7)
);
MUX2 mux_inst_400 (
  .O(mux_o_400),
  .I0(mux_o_395),
  .I1(mux_o_396),
  .S0(dff_q_6)
);
MUX2 mux_inst_401 (
  .O(mux_o_401),
  .I0(mux_o_397),
  .I1(mux_o_398),
  .S0(dff_q_6)
);
MUX2 mux_inst_403 (
  .O(mux_o_403),
  .I0(mux_o_400),
  .I1(mux_o_401),
  .S0(dff_q_5)
);
MUX2 mux_inst_405 (
  .O(doutb[6]),
  .I0(mux_o_403),
  .I1(mux_o_399),
  .S0(dff_q_4)
);
MUX2 mux_inst_416 (
  .O(mux_o_416),
  .I0(dpx9b_inst_0_doutb[7]),
  .I1(dpx9b_inst_1_doutb[7]),
  .S0(dff_q_7)
);
MUX2 mux_inst_417 (
  .O(mux_o_417),
  .I0(dpx9b_inst_2_doutb[7]),
  .I1(dpx9b_inst_3_doutb[7]),
  .S0(dff_q_7)
);
MUX2 mux_inst_418 (
  .O(mux_o_418),
  .I0(dpx9b_inst_4_doutb[7]),
  .I1(dpx9b_inst_5_doutb[7]),
  .S0(dff_q_7)
);
MUX2 mux_inst_419 (
  .O(mux_o_419),
  .I0(dpx9b_inst_6_doutb[7]),
  .I1(dpx9b_inst_7_doutb[7]),
  .S0(dff_q_7)
);
MUX2 mux_inst_420 (
  .O(mux_o_420),
  .I0(dpb_inst_15_doutb[7]),
  .I1(dpb_inst_17_doutb[7]),
  .S0(dff_q_7)
);
MUX2 mux_inst_421 (
  .O(mux_o_421),
  .I0(mux_o_416),
  .I1(mux_o_417),
  .S0(dff_q_6)
);
MUX2 mux_inst_422 (
  .O(mux_o_422),
  .I0(mux_o_418),
  .I1(mux_o_419),
  .S0(dff_q_6)
);
MUX2 mux_inst_424 (
  .O(mux_o_424),
  .I0(mux_o_421),
  .I1(mux_o_422),
  .S0(dff_q_5)
);
MUX2 mux_inst_426 (
  .O(doutb[7]),
  .I0(mux_o_424),
  .I1(mux_o_420),
  .S0(dff_q_4)
);
MUX2 mux_inst_437 (
  .O(mux_o_437),
  .I0(dpx9b_inst_0_doutb[8]),
  .I1(dpx9b_inst_1_doutb[8]),
  .S0(dff_q_7)
);
MUX2 mux_inst_438 (
  .O(mux_o_438),
  .I0(dpx9b_inst_2_doutb[8]),
  .I1(dpx9b_inst_3_doutb[8]),
  .S0(dff_q_7)
);
MUX2 mux_inst_439 (
  .O(mux_o_439),
  .I0(dpx9b_inst_4_doutb[8]),
  .I1(dpx9b_inst_5_doutb[8]),
  .S0(dff_q_7)
);
MUX2 mux_inst_440 (
  .O(mux_o_440),
  .I0(dpx9b_inst_6_doutb[8]),
  .I1(dpx9b_inst_7_doutb[8]),
  .S0(dff_q_7)
);
MUX2 mux_inst_441 (
  .O(mux_o_441),
  .I0(dpb_inst_16_doutb[8]),
  .I1(dpb_inst_17_doutb[8]),
  .S0(dff_q_7)
);
MUX2 mux_inst_442 (
  .O(mux_o_442),
  .I0(mux_o_437),
  .I1(mux_o_438),
  .S0(dff_q_6)
);
MUX2 mux_inst_443 (
  .O(mux_o_443),
  .I0(mux_o_439),
  .I1(mux_o_440),
  .S0(dff_q_6)
);
MUX2 mux_inst_445 (
  .O(mux_o_445),
  .I0(mux_o_442),
  .I1(mux_o_443),
  .S0(dff_q_5)
);
MUX2 mux_inst_447 (
  .O(doutb[8]),
  .I0(mux_o_445),
  .I1(mux_o_441),
  .S0(dff_q_4)
);
MUX2 mux_inst_452 (
  .O(mux_o_452),
  .I0(dpb_inst_16_doutb[9]),
  .I1(dpb_inst_17_doutb[9]),
  .S0(dff_q_7)
);
MUX2 mux_inst_457 (
  .O(doutb[9]),
  .I0(dpb_inst_8_doutb[9]),
  .I1(mux_o_452),
  .S0(dff_q_4)
);
MUX2 mux_inst_462 (
  .O(mux_o_462),
  .I0(dpb_inst_16_doutb[10]),
  .I1(dpb_inst_17_doutb[10]),
  .S0(dff_q_7)
);
MUX2 mux_inst_467 (
  .O(doutb[10]),
  .I0(dpb_inst_9_doutb[10]),
  .I1(mux_o_462),
  .S0(dff_q_4)
);
MUX2 mux_inst_472 (
  .O(mux_o_472),
  .I0(dpb_inst_16_doutb[11]),
  .I1(dpb_inst_17_doutb[11]),
  .S0(dff_q_7)
);
MUX2 mux_inst_477 (
  .O(doutb[11]),
  .I0(dpb_inst_10_doutb[11]),
  .I1(mux_o_472),
  .S0(dff_q_4)
);
MUX2 mux_inst_482 (
  .O(mux_o_482),
  .I0(dpb_inst_16_doutb[12]),
  .I1(dpb_inst_17_doutb[12]),
  .S0(dff_q_7)
);
MUX2 mux_inst_487 (
  .O(doutb[12]),
  .I0(dpb_inst_11_doutb[12]),
  .I1(mux_o_482),
  .S0(dff_q_4)
);
MUX2 mux_inst_492 (
  .O(mux_o_492),
  .I0(dpb_inst_16_doutb[13]),
  .I1(dpb_inst_17_doutb[13]),
  .S0(dff_q_7)
);
MUX2 mux_inst_497 (
  .O(doutb[13]),
  .I0(dpb_inst_12_doutb[13]),
  .I1(mux_o_492),
  .S0(dff_q_4)
);
MUX2 mux_inst_502 (
  .O(mux_o_502),
  .I0(dpb_inst_16_doutb[14]),
  .I1(dpb_inst_17_doutb[14]),
  .S0(dff_q_7)
);
MUX2 mux_inst_507 (
  .O(doutb[14]),
  .I0(dpb_inst_13_doutb[14]),
  .I1(mux_o_502),
  .S0(dff_q_4)
);
MUX2 mux_inst_512 (
  .O(mux_o_512),
  .I0(dpb_inst_16_doutb[15]),
  .I1(dpb_inst_17_doutb[15]),
  .S0(dff_q_7)
);
MUX2 mux_inst_517 (
  .O(doutb[15]),
  .I0(dpb_inst_14_doutb[15]),
  .I1(mux_o_512),
  .S0(dff_q_4)
);
endmodule //Gowin_DPB
