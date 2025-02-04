onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+soc_mmcm -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.soc_mmcm xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {soc_mmcm.udo}

run -all

endsim

quit -force
