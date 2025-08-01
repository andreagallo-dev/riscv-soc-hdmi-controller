 /*                                                                      
 Copyright 2018 Nuclei System Technology, Inc.                
                                                                         
 Licensed under the Apache License, Version 2.0 (the "License");         
 you may not use this file except in compliance with the License.        
 You may obtain a copy of the License at                                 
                                                                         
     http://www.apache.org/licenses/LICENSE-2.0                          
                                                                         
  Unless required by applicable law or agreed to in writing, software    
 distributed under the License is distributed on an "AS IS" BASIS,       
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and     
 limitations under the License.                                          
 */                                                                      
                                                                         
                                                                         
                                                                         
module e203_soc_top(

    output                    H_sync, 
    output                    V_sync,
    output[7:0]               Red,
    output[7:0]               Green,
    output[7:0]               Blue,

    // This clock should comes from the crystal pad generated high speed clock (16MHz)
  input  hfextclk,
  output hfxoscen,// The signal to enable the crystal pad generated clock

  // This clock should comes from the crystal pad generated low speed clock (32.768KHz)
  input  lfextclk,
  output lfxoscen,// The signal to enable the crystal pad generated clock


  // The JTAG TCK is input, need to be pull-up
  input   io_pads_jtag_TCK_i_ival,

  // The JTAG TMS is input, need to be pull-up
  input   io_pads_jtag_TMS_i_ival,

  // The JTAG TDI is input, need to be pull-up
  input   io_pads_jtag_TDI_i_ival,

  // The JTAG TDO is output have enable
  output  io_pads_jtag_TDO_o_oval,
  output  io_pads_jtag_TDO_o_oe,

  // The GPIO are all bidir pad have enables
  input   io_pads_gpio_0_i_ival,
  output  io_pads_gpio_0_o_oval,
  output  io_pads_gpio_0_o_oe,
  output  io_pads_gpio_0_o_ie,
  output  io_pads_gpio_0_o_pue,
  output  io_pads_gpio_0_o_ds,
  
  input   io_pads_gpio_1_i_ival,
  output  io_pads_gpio_1_o_oval,
  output  io_pads_gpio_1_o_oe,
  output  io_pads_gpio_1_o_ie,
  output  io_pads_gpio_1_o_pue,
  output  io_pads_gpio_1_o_ds,
  
  input   io_pads_gpio_2_i_ival,
  output  io_pads_gpio_2_o_oval,
  output  io_pads_gpio_2_o_oe,
  output  io_pads_gpio_2_o_ie,
  output  io_pads_gpio_2_o_pue,
  output  io_pads_gpio_2_o_ds,
  
  input   io_pads_gpio_3_i_ival,
  output  io_pads_gpio_3_o_oval,
  output  io_pads_gpio_3_o_oe,
  output  io_pads_gpio_3_o_ie,
  output  io_pads_gpio_3_o_pue,
  output  io_pads_gpio_3_o_ds,
  
  input   io_pads_gpio_4_i_ival,
  output  io_pads_gpio_4_o_oval,
  output  io_pads_gpio_4_o_oe,
  output  io_pads_gpio_4_o_ie,
  output  io_pads_gpio_4_o_pue,
  output  io_pads_gpio_4_o_ds,
  
  input   io_pads_gpio_5_i_ival,
  output  io_pads_gpio_5_o_oval,
  output  io_pads_gpio_5_o_oe,
  output  io_pads_gpio_5_o_ie,
  output  io_pads_gpio_5_o_pue,
  output  io_pads_gpio_5_o_ds,
  
  input   io_pads_gpio_6_i_ival,
  output  io_pads_gpio_6_o_oval,
  output  io_pads_gpio_6_o_oe,
  output  io_pads_gpio_6_o_ie,
  output  io_pads_gpio_6_o_pue,
  output  io_pads_gpio_6_o_ds,
  
  input   io_pads_gpio_7_i_ival,
  output  io_pads_gpio_7_o_oval,
  output  io_pads_gpio_7_o_oe,
  output  io_pads_gpio_7_o_ie,
  output  io_pads_gpio_7_o_pue,
  output  io_pads_gpio_7_o_ds,
  
  input   io_pads_gpio_8_i_ival,
  output  io_pads_gpio_8_o_oval,
  output  io_pads_gpio_8_o_oe,
  output  io_pads_gpio_8_o_ie,
  output  io_pads_gpio_8_o_pue,
  output  io_pads_gpio_8_o_ds,
  
  input   io_pads_gpio_9_i_ival,
  output  io_pads_gpio_9_o_oval,
  output  io_pads_gpio_9_o_oe,
  output  io_pads_gpio_9_o_ie,
  output  io_pads_gpio_9_o_pue,
  output  io_pads_gpio_9_o_ds,
  
  input   io_pads_gpio_10_i_ival,
  output  io_pads_gpio_10_o_oval,
  output  io_pads_gpio_10_o_oe,
  output  io_pads_gpio_10_o_ie,
  output  io_pads_gpio_10_o_pue,
  output  io_pads_gpio_10_o_ds,
  
  input   io_pads_gpio_11_i_ival,
  output  io_pads_gpio_11_o_oval,
  output  io_pads_gpio_11_o_oe,
  output  io_pads_gpio_11_o_ie,
  output  io_pads_gpio_11_o_pue,
  output  io_pads_gpio_11_o_ds,
  
  input   io_pads_gpio_12_i_ival,
  output  io_pads_gpio_12_o_oval,
  output  io_pads_gpio_12_o_oe,
  output  io_pads_gpio_12_o_ie,
  output  io_pads_gpio_12_o_pue,
  output  io_pads_gpio_12_o_ds,
  
  input   io_pads_gpio_13_i_ival,
  output  io_pads_gpio_13_o_oval,
  output  io_pads_gpio_13_o_oe,
  output  io_pads_gpio_13_o_ie,
  output  io_pads_gpio_13_o_pue,
  output  io_pads_gpio_13_o_ds,
  
  input   io_pads_gpio_14_i_ival,
  output  io_pads_gpio_14_o_oval,
  output  io_pads_gpio_14_o_oe,
  output  io_pads_gpio_14_o_ie,
  output  io_pads_gpio_14_o_pue,
  output  io_pads_gpio_14_o_ds,
  
  input   io_pads_gpio_15_i_ival,
  output  io_pads_gpio_15_o_oval,
  output  io_pads_gpio_15_o_oe,
  output  io_pads_gpio_15_o_ie,
  output  io_pads_gpio_15_o_pue,
  output  io_pads_gpio_15_o_ds,
  
  input   io_pads_gpio_16_i_ival,
  output  io_pads_gpio_16_o_oval,
  output  io_pads_gpio_16_o_oe,
  output  io_pads_gpio_16_o_ie,
  output  io_pads_gpio_16_o_pue,
  output  io_pads_gpio_16_o_ds,
  
  input   io_pads_gpio_17_i_ival,
  output  io_pads_gpio_17_o_oval,
  output  io_pads_gpio_17_o_oe,
  output  io_pads_gpio_17_o_ie,
  output  io_pads_gpio_17_o_pue,
  output  io_pads_gpio_17_o_ds,
  
  input   io_pads_gpio_18_i_ival,
  output  io_pads_gpio_18_o_oval,
  output  io_pads_gpio_18_o_oe,
  output  io_pads_gpio_18_o_ie,
  output  io_pads_gpio_18_o_pue,
  output  io_pads_gpio_18_o_ds,
  
  input   io_pads_gpio_19_i_ival,
  output  io_pads_gpio_19_o_oval,
  output  io_pads_gpio_19_o_oe,
  output  io_pads_gpio_19_o_ie,
  output  io_pads_gpio_19_o_pue,
  output  io_pads_gpio_19_o_ds,
  
  input   io_pads_gpio_20_i_ival,
  output  io_pads_gpio_20_o_oval,
  output  io_pads_gpio_20_o_oe,
  output  io_pads_gpio_20_o_ie,
  output  io_pads_gpio_20_o_pue,
  output  io_pads_gpio_20_o_ds,
  
  input   io_pads_gpio_21_i_ival,
  output  io_pads_gpio_21_o_oval,
  output  io_pads_gpio_21_o_oe,
  output  io_pads_gpio_21_o_ie,
  output  io_pads_gpio_21_o_pue,
  output  io_pads_gpio_21_o_ds,
  
  input   io_pads_gpio_22_i_ival,
  output  io_pads_gpio_22_o_oval,
  output  io_pads_gpio_22_o_oe,
  output  io_pads_gpio_22_o_ie,
  output  io_pads_gpio_22_o_pue,
  output  io_pads_gpio_22_o_ds,
  
  input   io_pads_gpio_23_i_ival,
  output  io_pads_gpio_23_o_oval,
  output  io_pads_gpio_23_o_oe,
  output  io_pads_gpio_23_o_ie,
  output  io_pads_gpio_23_o_pue,
  output  io_pads_gpio_23_o_ds,
  
  input   io_pads_gpio_24_i_ival,
  output  io_pads_gpio_24_o_oval,
  output  io_pads_gpio_24_o_oe,
  output  io_pads_gpio_24_o_ie,
  output  io_pads_gpio_24_o_pue,
  output  io_pads_gpio_24_o_ds,
  
  input   io_pads_gpio_25_i_ival,
  output  io_pads_gpio_25_o_oval,
  output  io_pads_gpio_25_o_oe,
  output  io_pads_gpio_25_o_ie,
  output  io_pads_gpio_25_o_pue,
  output  io_pads_gpio_25_o_ds,
  
  input   io_pads_gpio_26_i_ival,
  output  io_pads_gpio_26_o_oval,
  output  io_pads_gpio_26_o_oe,
  output  io_pads_gpio_26_o_ie,
  output  io_pads_gpio_26_o_pue,
  output  io_pads_gpio_26_o_ds,
  
  input   io_pads_gpio_27_i_ival,
  output  io_pads_gpio_27_o_oval,
  output  io_pads_gpio_27_o_oe,
  output  io_pads_gpio_27_o_ie,
  output  io_pads_gpio_27_o_pue,
  output  io_pads_gpio_27_o_ds,
  
  input   io_pads_gpio_28_i_ival,
  output  io_pads_gpio_28_o_oval,
  output  io_pads_gpio_28_o_oe,
  output  io_pads_gpio_28_o_ie,
  output  io_pads_gpio_28_o_pue,
  output  io_pads_gpio_28_o_ds,
  
  input   io_pads_gpio_29_i_ival,
  output  io_pads_gpio_29_o_oval,
  output  io_pads_gpio_29_o_oe,
  output  io_pads_gpio_29_o_ie,
  output  io_pads_gpio_29_o_pue,
  output  io_pads_gpio_29_o_ds,
  
  input   io_pads_gpio_30_i_ival,
  output  io_pads_gpio_30_o_oval,
  output  io_pads_gpio_30_o_oe,
  output  io_pads_gpio_30_o_ie,
  output  io_pads_gpio_30_o_pue,
  output  io_pads_gpio_30_o_ds,
  
  input   io_pads_gpio_31_i_ival,
  output  io_pads_gpio_31_o_oval,
  output  io_pads_gpio_31_o_oe,
  output  io_pads_gpio_31_o_ie,
  output  io_pads_gpio_31_o_pue,
  output  io_pads_gpio_31_o_ds,


  //QSPI SCK and CS is output without enable
  output  io_pads_qspi_sck_o_oval,
  output  io_pads_qspi_cs_0_o_oval,

  //QSPI DQ is bidir I/O with enable, and need pull-up enable
  input   io_pads_qspi_dq_0_i_ival,
  output  io_pads_qspi_dq_0_o_oval,
  output  io_pads_qspi_dq_0_o_oe,
  output  io_pads_qspi_dq_0_o_ie,
  output  io_pads_qspi_dq_0_o_pue,
  output  io_pads_qspi_dq_0_o_ds,

  input   io_pads_qspi_dq_1_i_ival,
  output  io_pads_qspi_dq_1_o_oval,
  output  io_pads_qspi_dq_1_o_oe,
  output  io_pads_qspi_dq_1_o_ie,
  output  io_pads_qspi_dq_1_o_pue,
  output  io_pads_qspi_dq_1_o_ds,

  input   io_pads_qspi_dq_2_i_ival,
  output  io_pads_qspi_dq_2_o_oval,
  output  io_pads_qspi_dq_2_o_oe,
  output  io_pads_qspi_dq_2_o_ie,
  output  io_pads_qspi_dq_2_o_pue,
  output  io_pads_qspi_dq_2_o_ds,

  input   io_pads_qspi_dq_3_i_ival,
  output  io_pads_qspi_dq_3_o_oval,
  output  io_pads_qspi_dq_3_o_oe,
  output  io_pads_qspi_dq_3_o_ie,
  output  io_pads_qspi_dq_3_o_pue,
  output  io_pads_qspi_dq_3_o_ds,

  // Erst is input need to be pull-up by default
  input   io_pads_aon_erst_n_i_ival,

  // dbgmode are inputs need to be pull-up by default
  input  io_pads_dbgmode0_n_i_ival,
  input  io_pads_dbgmode1_n_i_ival,
  input  io_pads_dbgmode2_n_i_ival,

  // BootRom is input need to be pull-up by default
  input  io_pads_bootrom_n_i_ival,


  // dwakeup is input need to be pull-up by default
  input  io_pads_aon_pmu_dwakeup_n_i_ival,

      // PMU output is just output without enable
  output io_pads_aon_pmu_padrst_o_oval,
  output io_pads_aon_pmu_vddpaden_o_oval 
);


 
 wire sysper_icb_cmd_valid;
 wire sysper_icb_cmd_ready;

 wire sysfio_icb_cmd_valid;
 wire sysfio_icb_cmd_ready;

 wire sysmem_icb_cmd_valid;
 wire sysmem_icb_cmd_ready;

 e203_subsys_top u_e203_subsys_top(

      .H_sync        (H_sync),
      .V_sync        (V_sync), 
      .Red           (Red), 
      .Green         (Green), 
      .Blue          (Blue),

    .core_mhartid      (1'b0),
  



  `ifdef E203_HAS_ITCM_EXTITF //{
    .ext2itcm_icb_cmd_valid  (1'b0),
    .ext2itcm_icb_cmd_ready  (),
    .ext2itcm_icb_cmd_addr   (`E203_ITCM_ADDR_WIDTH'b0 ),
    .ext2itcm_icb_cmd_read   (1'b0 ),
    .ext2itcm_icb_cmd_wdata  (32'b0),
    .ext2itcm_icb_cmd_wmask  (4'b0),
    
    .ext2itcm_icb_rsp_valid  (),
    .ext2itcm_icb_rsp_ready  (1'b0),
    .ext2itcm_icb_rsp_err    (),
    .ext2itcm_icb_rsp_rdata  (),
  `endif//}

  `ifdef E203_HAS_DTCM_EXTITF //{
    .ext2dtcm_icb_cmd_valid  (1'b0),
    .ext2dtcm_icb_cmd_ready  (),
    .ext2dtcm_icb_cmd_addr   (`E203_DTCM_ADDR_WIDTH'b0 ),
    .ext2dtcm_icb_cmd_read   (1'b0 ),
    .ext2dtcm_icb_cmd_wdata  (32'b0),
    .ext2dtcm_icb_cmd_wmask  (4'b0),
    
    .ext2dtcm_icb_rsp_valid  (),
    .ext2dtcm_icb_rsp_ready  (1'b0),
    .ext2dtcm_icb_rsp_err    (),
    .ext2dtcm_icb_rsp_rdata  (),
  `endif//}

  .sysper_icb_cmd_valid (sysper_icb_cmd_valid),
  .sysper_icb_cmd_ready (sysper_icb_cmd_ready),
  .sysper_icb_cmd_read  (), 
  .sysper_icb_cmd_addr  (), 
  .sysper_icb_cmd_wdata (), 
  .sysper_icb_cmd_wmask (), 
  
  .sysper_icb_rsp_valid (sysper_icb_cmd_valid),
  .sysper_icb_rsp_ready (sysper_icb_cmd_ready),
  .sysper_icb_rsp_err   (1'b0  ),
  .sysper_icb_rsp_rdata (32'b0),


  .sysfio_icb_cmd_valid(sysfio_icb_cmd_valid),
  .sysfio_icb_cmd_ready(sysfio_icb_cmd_ready),
  .sysfio_icb_cmd_read (), 
  .sysfio_icb_cmd_addr (), 
  .sysfio_icb_cmd_wdata(), 
  .sysfio_icb_cmd_wmask(), 
   
  .sysfio_icb_rsp_valid(sysfio_icb_cmd_valid),
  .sysfio_icb_rsp_ready(sysfio_icb_cmd_ready),
  .sysfio_icb_rsp_err  (1'b0  ),
  .sysfio_icb_rsp_rdata(32'b0),

  .sysmem_icb_cmd_valid(sysmem_icb_cmd_valid),
  .sysmem_icb_cmd_ready(sysmem_icb_cmd_ready),
  .sysmem_icb_cmd_read (), 
  .sysmem_icb_cmd_addr (), 
  .sysmem_icb_cmd_wdata(), 
  .sysmem_icb_cmd_wmask(), 

  .sysmem_icb_rsp_valid(sysmem_icb_cmd_valid),
  .sysmem_icb_rsp_ready(sysmem_icb_cmd_ready),
  .sysmem_icb_rsp_err  (1'b0  ),
  .sysmem_icb_rsp_rdata(32'b0),

  .io_pads_jtag_TCK_i_ival    (io_pads_jtag_TCK_i_ival    ),
  .io_pads_jtag_TCK_o_oval    (),
  .io_pads_jtag_TCK_o_oe      (),
  .io_pads_jtag_TCK_o_ie      (),
  .io_pads_jtag_TCK_o_pue     (),
  .io_pads_jtag_TCK_o_ds      (),

  .io_pads_jtag_TMS_i_ival    (io_pads_jtag_TMS_i_ival    ),
  .io_pads_jtag_TMS_o_oval    (),
  .io_pads_jtag_TMS_o_oe      (),
  .io_pads_jtag_TMS_o_ie      (),
  .io_pads_jtag_TMS_o_pue     (),
  .io_pads_jtag_TMS_o_ds      (),

  .io_pads_jtag_TDI_i_ival    (io_pads_jtag_TDI_i_ival    ),
  .io_pads_jtag_TDI_o_oval    (),
  .io_pads_jtag_TDI_o_oe      (),
  .io_pads_jtag_TDI_o_ie      (),
  .io_pads_jtag_TDI_o_pue     (),
  .io_pads_jtag_TDI_o_ds      (),

  .io_pads_jtag_TDO_i_ival    (1'b1    ),
  .io_pads_jtag_TDO_o_oval    (io_pads_jtag_TDO_o_oval    ),
  .io_pads_jtag_TDO_o_oe      (io_pads_jtag_TDO_o_oe      ),
  .io_pads_jtag_TDO_o_ie      (),
  .io_pads_jtag_TDO_o_pue     (),
  .io_pads_jtag_TDO_o_ds      (),

  .io_pads_jtag_TRST_n_i_ival (1'b1 ),
  .io_pads_jtag_TRST_n_o_oval (),
  .io_pads_jtag_TRST_n_o_oe   (),
  .io_pads_jtag_TRST_n_o_ie   (),
  .io_pads_jtag_TRST_n_o_pue  (),
  .io_pads_jtag_TRST_n_o_ds   (),

  .test_mode(1'b1),
  .test_iso_override(1'b0),

  .io_pads_gpio_0_i_ival           (io_pads_gpio_0_i_ival & io_pads_gpio_0_o_ie),
  .io_pads_gpio_0_o_oval           (io_pads_gpio_0_o_oval),
  .io_pads_gpio_0_o_oe             (io_pads_gpio_0_o_oe),
  .io_pads_gpio_0_o_ie             (io_pads_gpio_0_o_ie),
  .io_pads_gpio_0_o_pue            (io_pads_gpio_0_o_pue),
  .io_pads_gpio_0_o_ds             (io_pads_gpio_0_o_ds),

  .io_pads_gpio_1_i_ival           (io_pads_gpio_1_i_ival & io_pads_gpio_1_o_ie),
  .io_pads_gpio_1_o_oval           (io_pads_gpio_1_o_oval),
  .io_pads_gpio_1_o_oe             (io_pads_gpio_1_o_oe),
  .io_pads_gpio_1_o_ie             (io_pads_gpio_1_o_ie),
  .io_pads_gpio_1_o_pue            (io_pads_gpio_1_o_pue),
  .io_pads_gpio_1_o_ds             (io_pads_gpio_1_o_ds),

  .io_pads_gpio_2_i_ival           (io_pads_gpio_2_i_ival & io_pads_gpio_2_o_ie),
  .io_pads_gpio_2_o_oval           (io_pads_gpio_2_o_oval),
  .io_pads_gpio_2_o_oe             (io_pads_gpio_2_o_oe),
  .io_pads_gpio_2_o_ie             (io_pads_gpio_2_o_ie),
  .io_pads_gpio_2_o_pue            (io_pads_gpio_2_o_pue),
  .io_pads_gpio_2_o_ds             (io_pads_gpio_2_o_ds),

  .io_pads_gpio_3_i_ival           (io_pads_gpio_3_i_ival & io_pads_gpio_3_o_ie),
  .io_pads_gpio_3_o_oval           (io_pads_gpio_3_o_oval),
  .io_pads_gpio_3_o_oe             (io_pads_gpio_3_o_oe),
  .io_pads_gpio_3_o_ie             (io_pads_gpio_3_o_ie),
  .io_pads_gpio_3_o_pue            (io_pads_gpio_3_o_pue),
  .io_pads_gpio_3_o_ds             (io_pads_gpio_3_o_ds),

  .io_pads_gpio_4_i_ival           (io_pads_gpio_4_i_ival & io_pads_gpio_4_o_ie),
  .io_pads_gpio_4_o_oval           (io_pads_gpio_4_o_oval),
  .io_pads_gpio_4_o_oe             (io_pads_gpio_4_o_oe),
  .io_pads_gpio_4_o_ie             (io_pads_gpio_4_o_ie),
  .io_pads_gpio_4_o_pue            (io_pads_gpio_4_o_pue),
  .io_pads_gpio_4_o_ds             (io_pads_gpio_4_o_ds),

  .io_pads_gpio_5_i_ival           (io_pads_gpio_5_i_ival & io_pads_gpio_5_o_ie),
  .io_pads_gpio_5_o_oval           (io_pads_gpio_5_o_oval),
  .io_pads_gpio_5_o_oe             (io_pads_gpio_5_o_oe),
  .io_pads_gpio_5_o_ie             (io_pads_gpio_5_o_ie),
  .io_pads_gpio_5_o_pue            (io_pads_gpio_5_o_pue),
  .io_pads_gpio_5_o_ds             (io_pads_gpio_5_o_ds),

  .io_pads_gpio_6_i_ival           (io_pads_gpio_6_i_ival & io_pads_gpio_6_o_ie),
  .io_pads_gpio_6_o_oval           (io_pads_gpio_6_o_oval),
  .io_pads_gpio_6_o_oe             (io_pads_gpio_6_o_oe),
  .io_pads_gpio_6_o_ie             (io_pads_gpio_6_o_ie),
  .io_pads_gpio_6_o_pue            (io_pads_gpio_6_o_pue),
  .io_pads_gpio_6_o_ds             (io_pads_gpio_6_o_ds),

  .io_pads_gpio_7_i_ival           (io_pads_gpio_7_i_ival & io_pads_gpio_7_o_ie),
  .io_pads_gpio_7_o_oval           (io_pads_gpio_7_o_oval),
  .io_pads_gpio_7_o_oe             (io_pads_gpio_7_o_oe),
  .io_pads_gpio_7_o_ie             (io_pads_gpio_7_o_ie),
  .io_pads_gpio_7_o_pue            (io_pads_gpio_7_o_pue),
  .io_pads_gpio_7_o_ds             (io_pads_gpio_7_o_ds),

  .io_pads_gpio_8_i_ival           (io_pads_gpio_8_i_ival & io_pads_gpio_8_o_ie),
  .io_pads_gpio_8_o_oval           (io_pads_gpio_8_o_oval),
  .io_pads_gpio_8_o_oe             (io_pads_gpio_8_o_oe),
  .io_pads_gpio_8_o_ie             (io_pads_gpio_8_o_ie),
  .io_pads_gpio_8_o_pue            (io_pads_gpio_8_o_pue),
  .io_pads_gpio_8_o_ds             (io_pads_gpio_8_o_ds),

  .io_pads_gpio_9_i_ival           (io_pads_gpio_9_i_ival & io_pads_gpio_9_o_ie),
  .io_pads_gpio_9_o_oval           (io_pads_gpio_9_o_oval),
  .io_pads_gpio_9_o_oe             (io_pads_gpio_9_o_oe),
  .io_pads_gpio_9_o_ie             (io_pads_gpio_9_o_ie),
  .io_pads_gpio_9_o_pue            (io_pads_gpio_9_o_pue),
  .io_pads_gpio_9_o_ds             (io_pads_gpio_9_o_ds),

  .io_pads_gpio_10_i_ival          (io_pads_gpio_10_i_ival & io_pads_gpio_10_o_ie),
  .io_pads_gpio_10_o_oval          (io_pads_gpio_10_o_oval),
  .io_pads_gpio_10_o_oe            (io_pads_gpio_10_o_oe),
  .io_pads_gpio_10_o_ie            (io_pads_gpio_10_o_ie),
  .io_pads_gpio_10_o_pue           (io_pads_gpio_10_o_pue),
  .io_pads_gpio_10_o_ds            (io_pads_gpio_10_o_ds),

  .io_pads_gpio_11_i_ival          (io_pads_gpio_11_i_ival & io_pads_gpio_11_o_ie),
  .io_pads_gpio_11_o_oval          (io_pads_gpio_11_o_oval),
  .io_pads_gpio_11_o_oe            (io_pads_gpio_11_o_oe),
  .io_pads_gpio_11_o_ie            (io_pads_gpio_11_o_ie),
  .io_pads_gpio_11_o_pue           (io_pads_gpio_11_o_pue),
  .io_pads_gpio_11_o_ds            (io_pads_gpio_11_o_ds),

  .io_pads_gpio_12_i_ival          (io_pads_gpio_12_i_ival & io_pads_gpio_12_o_ie),
  .io_pads_gpio_12_o_oval          (io_pads_gpio_12_o_oval),
  .io_pads_gpio_12_o_oe            (io_pads_gpio_12_o_oe),
  .io_pads_gpio_12_o_ie            (io_pads_gpio_12_o_ie),
  .io_pads_gpio_12_o_pue           (io_pads_gpio_12_o_pue),
  .io_pads_gpio_12_o_ds            (io_pads_gpio_12_o_ds),

  .io_pads_gpio_13_i_ival          (io_pads_gpio_13_i_ival & io_pads_gpio_13_o_ie),
  .io_pads_gpio_13_o_oval          (io_pads_gpio_13_o_oval),
  .io_pads_gpio_13_o_oe            (io_pads_gpio_13_o_oe),
  .io_pads_gpio_13_o_ie            (io_pads_gpio_13_o_ie),
  .io_pads_gpio_13_o_pue           (io_pads_gpio_13_o_pue),
  .io_pads_gpio_13_o_ds            (io_pads_gpio_13_o_ds),

  .io_pads_gpio_14_i_ival          (io_pads_gpio_14_i_ival & io_pads_gpio_14_o_ie),
  .io_pads_gpio_14_o_oval          (io_pads_gpio_14_o_oval),
  .io_pads_gpio_14_o_oe            (io_pads_gpio_14_o_oe),
  .io_pads_gpio_14_o_ie            (io_pads_gpio_14_o_ie),
  .io_pads_gpio_14_o_pue           (io_pads_gpio_14_o_pue),
  .io_pads_gpio_14_o_ds            (io_pads_gpio_14_o_ds),

  .io_pads_gpio_15_i_ival          (io_pads_gpio_15_i_ival & io_pads_gpio_15_o_ie),
  .io_pads_gpio_15_o_oval          (io_pads_gpio_15_o_oval),
  .io_pads_gpio_15_o_oe            (io_pads_gpio_15_o_oe),
  .io_pads_gpio_15_o_ie            (io_pads_gpio_15_o_ie),
  .io_pads_gpio_15_o_pue           (io_pads_gpio_15_o_pue),
  .io_pads_gpio_15_o_ds            (io_pads_gpio_15_o_ds),

  .io_pads_gpio_16_i_ival          (io_pads_gpio_16_i_ival & io_pads_gpio_16_o_ie),
  .io_pads_gpio_16_o_oval          (io_pads_gpio_16_o_oval),
  .io_pads_gpio_16_o_oe            (io_pads_gpio_16_o_oe),
  .io_pads_gpio_16_o_ie            (io_pads_gpio_16_o_ie),
  .io_pads_gpio_16_o_pue           (io_pads_gpio_16_o_pue),
  .io_pads_gpio_16_o_ds            (io_pads_gpio_16_o_ds),

  .io_pads_gpio_17_i_ival          (io_pads_gpio_17_i_ival & io_pads_gpio_17_o_ie),
  .io_pads_gpio_17_o_oval          (io_pads_gpio_17_o_oval),
  .io_pads_gpio_17_o_oe            (io_pads_gpio_17_o_oe),
  .io_pads_gpio_17_o_ie            (io_pads_gpio_17_o_ie),
  .io_pads_gpio_17_o_pue           (io_pads_gpio_17_o_pue),
  .io_pads_gpio_17_o_ds            (io_pads_gpio_17_o_ds),

  .io_pads_gpio_18_i_ival          (io_pads_gpio_18_i_ival & io_pads_gpio_18_o_ie),
  .io_pads_gpio_18_o_oval          (io_pads_gpio_18_o_oval),
  .io_pads_gpio_18_o_oe            (io_pads_gpio_18_o_oe),
  .io_pads_gpio_18_o_ie            (io_pads_gpio_18_o_ie),
  .io_pads_gpio_18_o_pue           (io_pads_gpio_18_o_pue),
  .io_pads_gpio_18_o_ds            (io_pads_gpio_18_o_ds),

  .io_pads_gpio_19_i_ival          (io_pads_gpio_19_i_ival & io_pads_gpio_19_o_ie),
  .io_pads_gpio_19_o_oval          (io_pads_gpio_19_o_oval),
  .io_pads_gpio_19_o_oe            (io_pads_gpio_19_o_oe),
  .io_pads_gpio_19_o_ie            (io_pads_gpio_19_o_ie),
  .io_pads_gpio_19_o_pue           (io_pads_gpio_19_o_pue),
  .io_pads_gpio_19_o_ds            (io_pads_gpio_19_o_ds),

  .io_pads_gpio_20_i_ival          (io_pads_gpio_20_i_ival & io_pads_gpio_20_o_ie),
  .io_pads_gpio_20_o_oval          (io_pads_gpio_20_o_oval),
  .io_pads_gpio_20_o_oe            (io_pads_gpio_20_o_oe),
  .io_pads_gpio_20_o_ie            (io_pads_gpio_20_o_ie),
  .io_pads_gpio_20_o_pue           (io_pads_gpio_20_o_pue),
  .io_pads_gpio_20_o_ds            (io_pads_gpio_20_o_ds),

  .io_pads_gpio_21_i_ival          (io_pads_gpio_21_i_ival & io_pads_gpio_21_o_ie),
  .io_pads_gpio_21_o_oval          (io_pads_gpio_21_o_oval),
  .io_pads_gpio_21_o_oe            (io_pads_gpio_21_o_oe),
  .io_pads_gpio_21_o_ie            (io_pads_gpio_21_o_ie),
  .io_pads_gpio_21_o_pue           (io_pads_gpio_21_o_pue),
  .io_pads_gpio_21_o_ds            (io_pads_gpio_21_o_ds),

  .io_pads_gpio_22_i_ival          (io_pads_gpio_22_i_ival & io_pads_gpio_22_o_ie),
  .io_pads_gpio_22_o_oval          (io_pads_gpio_22_o_oval),
  .io_pads_gpio_22_o_oe            (io_pads_gpio_22_o_oe),
  .io_pads_gpio_22_o_ie            (io_pads_gpio_22_o_ie),
  .io_pads_gpio_22_o_pue           (io_pads_gpio_22_o_pue),
  .io_pads_gpio_22_o_ds            (io_pads_gpio_22_o_ds),

  .io_pads_gpio_23_i_ival          (io_pads_gpio_23_i_ival & io_pads_gpio_23_o_ie),
  .io_pads_gpio_23_o_oval          (io_pads_gpio_23_o_oval),
  .io_pads_gpio_23_o_oe            (io_pads_gpio_23_o_oe),
  .io_pads_gpio_23_o_ie            (io_pads_gpio_23_o_ie),
  .io_pads_gpio_23_o_pue           (io_pads_gpio_23_o_pue),
  .io_pads_gpio_23_o_ds            (io_pads_gpio_23_o_ds),

  .io_pads_gpio_24_i_ival          (io_pads_gpio_24_i_ival & io_pads_gpio_24_o_ie),
  .io_pads_gpio_24_o_oval          (io_pads_gpio_24_o_oval),
  .io_pads_gpio_24_o_oe            (io_pads_gpio_24_o_oe),
  .io_pads_gpio_24_o_ie            (io_pads_gpio_24_o_ie),
  .io_pads_gpio_24_o_pue           (io_pads_gpio_24_o_pue),
  .io_pads_gpio_24_o_ds            (io_pads_gpio_24_o_ds),

  .io_pads_gpio_25_i_ival          (io_pads_gpio_25_i_ival & io_pads_gpio_25_o_ie),
  .io_pads_gpio_25_o_oval          (io_pads_gpio_25_o_oval),
  .io_pads_gpio_25_o_oe            (io_pads_gpio_25_o_oe),
  .io_pads_gpio_25_o_ie            (io_pads_gpio_25_o_ie),
  .io_pads_gpio_25_o_pue           (io_pads_gpio_25_o_pue),
  .io_pads_gpio_25_o_ds            (io_pads_gpio_25_o_ds),

  .io_pads_gpio_26_i_ival          (io_pads_gpio_26_i_ival & io_pads_gpio_26_o_ie),
  .io_pads_gpio_26_o_oval          (io_pads_gpio_26_o_oval),
  .io_pads_gpio_26_o_oe            (io_pads_gpio_26_o_oe),
  .io_pads_gpio_26_o_ie            (io_pads_gpio_26_o_ie),
  .io_pads_gpio_26_o_pue           (io_pads_gpio_26_o_pue),
  .io_pads_gpio_26_o_ds            (io_pads_gpio_26_o_ds),

  .io_pads_gpio_27_i_ival          (io_pads_gpio_27_i_ival & io_pads_gpio_27_o_ie),
  .io_pads_gpio_27_o_oval          (io_pads_gpio_27_o_oval),
  .io_pads_gpio_27_o_oe            (io_pads_gpio_27_o_oe),
  .io_pads_gpio_27_o_ie            (io_pads_gpio_27_o_ie),
  .io_pads_gpio_27_o_pue           (io_pads_gpio_27_o_pue),
  .io_pads_gpio_27_o_ds            (io_pads_gpio_27_o_ds),

  .io_pads_gpio_28_i_ival          (io_pads_gpio_28_i_ival & io_pads_gpio_28_o_ie),
  .io_pads_gpio_28_o_oval          (io_pads_gpio_28_o_oval),
  .io_pads_gpio_28_o_oe            (io_pads_gpio_28_o_oe),
  .io_pads_gpio_28_o_ie            (io_pads_gpio_28_o_ie),
  .io_pads_gpio_28_o_pue           (io_pads_gpio_28_o_pue),
  .io_pads_gpio_28_o_ds            (io_pads_gpio_28_o_ds),

  .io_pads_gpio_29_i_ival          (io_pads_gpio_29_i_ival & io_pads_gpio_29_o_ie),
  .io_pads_gpio_29_o_oval          (io_pads_gpio_29_o_oval),
  .io_pads_gpio_29_o_oe            (io_pads_gpio_29_o_oe),
  .io_pads_gpio_29_o_ie            (io_pads_gpio_29_o_ie),
  .io_pads_gpio_29_o_pue           (io_pads_gpio_29_o_pue),
  .io_pads_gpio_29_o_ds            (io_pads_gpio_29_o_ds),

  .io_pads_gpio_30_i_ival          (io_pads_gpio_30_i_ival & io_pads_gpio_30_o_ie),
  .io_pads_gpio_30_o_oval          (io_pads_gpio_30_o_oval),
  .io_pads_gpio_30_o_oe            (io_pads_gpio_30_o_oe),
  .io_pads_gpio_30_o_ie            (io_pads_gpio_30_o_ie),
  .io_pads_gpio_30_o_pue           (io_pads_gpio_30_o_pue),
  .io_pads_gpio_30_o_ds            (io_pads_gpio_30_o_ds),

  .io_pads_gpio_31_i_ival          (io_pads_gpio_31_i_ival & io_pads_gpio_31_o_ie),
  .io_pads_gpio_31_o_oval          (io_pads_gpio_31_o_oval),
  .io_pads_gpio_31_o_oe            (io_pads_gpio_31_o_oe),
  .io_pads_gpio_31_o_ie            (io_pads_gpio_31_o_ie),
  .io_pads_gpio_31_o_pue           (io_pads_gpio_31_o_pue),
  .io_pads_gpio_31_o_ds            (io_pads_gpio_31_o_ds),

  .io_pads_qspi_sck_i_ival    (1'b1 ),
  .io_pads_qspi_sck_o_oval    (io_pads_qspi_sck_o_oval ),
  .io_pads_qspi_sck_o_oe      (),
  .io_pads_qspi_sck_o_ie      (),
  .io_pads_qspi_sck_o_pue     (),
  .io_pads_qspi_sck_o_ds      (),
  .io_pads_qspi_dq_0_i_ival   (io_pads_qspi_dq_0_i_ival & io_pads_qspi_dq_0_o_ie),
  .io_pads_qspi_dq_0_o_oval   (io_pads_qspi_dq_0_o_oval),
  .io_pads_qspi_dq_0_o_oe     (io_pads_qspi_dq_0_o_oe  ),
  .io_pads_qspi_dq_0_o_ie     (io_pads_qspi_dq_0_o_ie  ),
  .io_pads_qspi_dq_0_o_pue    (io_pads_qspi_dq_0_o_pue ),
  .io_pads_qspi_dq_0_o_ds     (io_pads_qspi_dq_0_o_ds  ),

  .io_pads_qspi_dq_1_i_ival   (io_pads_qspi_dq_1_i_ival & io_pads_qspi_dq_1_o_ie),
  .io_pads_qspi_dq_1_o_oval   (io_pads_qspi_dq_1_o_oval),
  .io_pads_qspi_dq_1_o_oe     (io_pads_qspi_dq_1_o_oe  ),
  .io_pads_qspi_dq_1_o_ie     (io_pads_qspi_dq_1_o_ie  ),
  .io_pads_qspi_dq_1_o_pue    (io_pads_qspi_dq_1_o_pue ),
  .io_pads_qspi_dq_1_o_ds     (io_pads_qspi_dq_1_o_ds  ),

  .io_pads_qspi_dq_2_i_ival   (io_pads_qspi_dq_2_i_ival & io_pads_qspi_dq_2_o_ie),
  .io_pads_qspi_dq_2_o_oval   (io_pads_qspi_dq_2_o_oval),
  .io_pads_qspi_dq_2_o_oe     (io_pads_qspi_dq_2_o_oe  ),
  .io_pads_qspi_dq_2_o_ie     (io_pads_qspi_dq_2_o_ie  ),
  .io_pads_qspi_dq_2_o_pue    (io_pads_qspi_dq_2_o_pue ),
  .io_pads_qspi_dq_2_o_ds     (io_pads_qspi_dq_2_o_ds  ),

  .io_pads_qspi_dq_3_i_ival   (io_pads_qspi_dq_3_i_ival & io_pads_qspi_dq_3_o_ie),
  .io_pads_qspi_dq_3_o_oval   (io_pads_qspi_dq_3_o_oval),
  .io_pads_qspi_dq_3_o_oe     (io_pads_qspi_dq_3_o_oe  ),
  .io_pads_qspi_dq_3_o_ie     (io_pads_qspi_dq_3_o_ie  ),
  .io_pads_qspi_dq_3_o_pue    (io_pads_qspi_dq_3_o_pue ),
  .io_pads_qspi_dq_3_o_ds     (io_pads_qspi_dq_3_o_ds  ),
  .io_pads_qspi_cs_0_i_ival   (1'b1),
  .io_pads_qspi_cs_0_o_oval   (io_pads_qspi_cs_0_o_oval),
  .io_pads_qspi_cs_0_o_oe     (),
  .io_pads_qspi_cs_0_o_ie     (),
  .io_pads_qspi_cs_0_o_pue    (),
  .io_pads_qspi_cs_0_o_ds     (),

    .hfextclk        (hfextclk),
    .hfxoscen        (hfxoscen),
    .lfextclk        (lfextclk),
    .lfxoscen        (lfxoscen),

  .io_pads_aon_erst_n_i_ival        (io_pads_aon_erst_n_i_ival       ), 
  .io_pads_aon_erst_n_o_oval        (),
  .io_pads_aon_erst_n_o_oe          (),
  .io_pads_aon_erst_n_o_ie          (),
  .io_pads_aon_erst_n_o_pue         (),
  .io_pads_aon_erst_n_o_ds          (),
  .io_pads_aon_pmu_dwakeup_n_i_ival (io_pads_aon_pmu_dwakeup_n_i_ival),
  .io_pads_aon_pmu_dwakeup_n_o_oval (),
  .io_pads_aon_pmu_dwakeup_n_o_oe   (),
  .io_pads_aon_pmu_dwakeup_n_o_ie   (),
  .io_pads_aon_pmu_dwakeup_n_o_pue  (),
  .io_pads_aon_pmu_dwakeup_n_o_ds   (),
  .io_pads_aon_pmu_vddpaden_i_ival  (1'b1 ),
  .io_pads_aon_pmu_vddpaden_o_oval  (io_pads_aon_pmu_vddpaden_o_oval ),
  .io_pads_aon_pmu_vddpaden_o_oe    (),
  .io_pads_aon_pmu_vddpaden_o_ie    (),
  .io_pads_aon_pmu_vddpaden_o_pue   (),
  .io_pads_aon_pmu_vddpaden_o_ds    (),

  
    .io_pads_aon_pmu_padrst_i_ival    (1'b1 ),
    .io_pads_aon_pmu_padrst_o_oval    (io_pads_aon_pmu_padrst_o_oval ),
    .io_pads_aon_pmu_padrst_o_oe      (),
    .io_pads_aon_pmu_padrst_o_ie      (),
    .io_pads_aon_pmu_padrst_o_pue     (),
    .io_pads_aon_pmu_padrst_o_ds      (),

    .io_pads_bootrom_n_i_ival       (io_pads_bootrom_n_i_ival),
    .io_pads_bootrom_n_o_oval       (),
    .io_pads_bootrom_n_o_oe         (),
    .io_pads_bootrom_n_o_ie         (),
    .io_pads_bootrom_n_o_pue        (),
    .io_pads_bootrom_n_o_ds         (),

    .io_pads_dbgmode0_n_i_ival       (io_pads_dbgmode0_n_i_ival),

    .io_pads_dbgmode1_n_i_ival       (io_pads_dbgmode1_n_i_ival),

    .io_pads_dbgmode2_n_i_ival       (io_pads_dbgmode2_n_i_ival) 


  );

endmodule
