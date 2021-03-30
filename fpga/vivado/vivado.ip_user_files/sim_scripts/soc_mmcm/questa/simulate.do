onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib soc_mmcm_opt

do {wave.do}

view wave
view structure
view signals

do {soc_mmcm.udo}

run -all

quit -force
