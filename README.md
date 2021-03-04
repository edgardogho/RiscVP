# RiscVP
This is a RISC-V architecture written in VHDL (sim only). Project runs on Vivado 2019.2.
![BlockDiagram](https://user-images.githubusercontent.com/4956043/109964629-ad717a80-7ccc-11eb-82dd-445ad502d199.png)

Most of the RV32I is implemented (except fence, ecall, break and CSR access). All instructions are executed on 4 clock cycle except unaligned data memory access which has penalties. All unaligned access is supported and handled by hardware but breaks the 4 clock cycle per instruction. 

Instructions and data are store in a BLOCKRAM. There is a converter program (written in C) that transforms .bin RISC-V files into BLOCKRAM init lines.
Shifts are implemented using barrel shifters, ALU is combinational and there are alignment fix units to support unaligned access (data load and store).

This is intended to be used only on simulation (Vivado 2019.2 xsim), not to be implemented in a FPGA. A new version of this design will be implemented in Verilog with FPGA implementation in mind.

This project was designed for UNLaM (www.unlam.edu.ar) as part of the Programmable Logic Research Group (GILP).

![image](https://user-images.githubusercontent.com/4956043/109965614-f70e9500-7ccd-11eb-98a1-43543f8fecd9.png)
