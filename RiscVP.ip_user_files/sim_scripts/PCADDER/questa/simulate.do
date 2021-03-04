onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib PCADDER_opt

do {wave.do}

view wave
view structure
view signals

do {PCADDER.udo}

run -all

quit -force
