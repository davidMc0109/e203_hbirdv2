onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L xil_defaultlib -L secureip -L xpm -lib xil_defaultlib xil_defaultlib.reset_sys

do {wave.do}

view wave
view structure
view signals

do {reset_sys.udo}

run -all

quit -force
