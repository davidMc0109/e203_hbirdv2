vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr "+incdir+../../../ipstatic" \
"../../../../vivado.gen/sources_1/ip/soc_mmcm/soc_mmcm_clk_wiz.v" \
"../../../../vivado.gen/sources_1/ip/soc_mmcm/soc_mmcm.v" \


vlog -work xil_defaultlib \
"glbl.v"

