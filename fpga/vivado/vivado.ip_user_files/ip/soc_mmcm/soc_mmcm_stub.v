// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Mar 30 19:21:29 2021
// Host        : localhost running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/davidmc/Documents/learn/vivado/soc/e203_hbirdv2/fpga/vivado/vivado.gen/sources_1/ip/soc_mmcm/soc_mmcm_stub.v
// Design      : soc_mmcm
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module soc_mmcm(clk_out1, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,reset,locked,clk_in1" */;
  output clk_out1;
  input reset;
  output locked;
  input clk_in1;
endmodule
