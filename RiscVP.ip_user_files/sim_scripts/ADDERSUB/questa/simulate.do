onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ADDERSUB_opt

do {wave.do}

view wave
view structure
view signals

do {ADDERSUB.udo}

run -all

quit -force
