onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib JumpAdder_opt

do {wave.do}

view wave
view structure
view signals

do {JumpAdder.udo}

run -all

quit -force
