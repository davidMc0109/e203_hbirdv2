onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm -lib xil_defaultlib xil_defaultlib.soc_mmcm xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {soc_mmcm.udo}

run -all

quit -force
