-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../vivado.gen/sources_1/ip/soc_mmcm/soc_mmcm_clk_wiz.v" \
  "../../../../vivado.gen/sources_1/ip/soc_mmcm/soc_mmcm.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

