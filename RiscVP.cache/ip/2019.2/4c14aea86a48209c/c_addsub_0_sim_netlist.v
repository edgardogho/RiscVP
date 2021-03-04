// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Thu Jan 21 15:31:10 2021
// Host        : oryxpro running 64-bit Pop!_OS 20.04 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_addsub_0_sim_netlist.v
// Design      : c_addsub_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_0,c_addsub_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_14,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    ADD,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 add_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME add_intf, LAYERED_METADATA undef" *) input ADD;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [31:0]S;

  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
  wire CE;
  wire CLK;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "2" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "1" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_14 U0
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "2" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_14
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [31:0]A;
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [31:0]S;

  wire \<const0> ;
  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
  wire CE;
  wire CLK;
  wire [31:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "2" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "1" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_14_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
dmmXCzwxW2FLu/vVGpJzoQ/uTl0t/oirVzDN8rGCQ/cshHIr5KZa8hMP1zjDcrW6js/9tSBuCaB1
Ioj63zjqZA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
N9Ijk+dhcsedFOz7GhClRR68iRquy2ZzjVLVhi5GByFuPpr/oGFn021AFcKE54GT1hqizIMvWGS0
qRbWSO/aiWGT8c930WMeayc4xm2b65tzi7UyXSjcZqyZqk5spgPewfSuL0LKD5R4+zccn3yeTyAR
Cpi6LZ2KmpRW5biXvss=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M8NGALCMec7MmW5uPCxfU8HATjWU2XqyPU8phSDe3mtyor4pgfPtg5TJdKOytKhxa+fQwJxytwzI
KPxtYmaRH/KFiGrOvm7jO78NIlt31qN95S7sMYrLxORaZ4bbNMg4RfwEB0haV15qORczgxWEpvBX
6Qukl64ihp4NiBjXt4YYGoDiNMSczgOe3tLn7UWjfPQnsJ8aMxugelO5AciSBxAdohgLMRE3cu6p
gwakO6ytq1vAR8bqHLT8g/Kdsxn72SBHYdpkba0NfEvzzheOlZY7fNuWD48V6QefMjsX1taMkmQH
m38VdXlC6Ocia7H3zT8LvNLtxrpG8zyD+UI+sg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
I1BukTJgP0oEpI/mdw6jwrYhUTr7MTzY5G/EvfuPKQfGzYRI1qLG+aEQeclA1P65+tkbstBEIIg8
ZhiouPVaom8KwKZHBX7eLpxvNBcYVFfnJb1ES5wdcph3sgGtaYKSpspp51oYPM6ZD7DmMGdoc/Wg
JVIUuIfRpo8AnEMfkayPkbwuB0VUKpz5BXS50B+5jvgK7cFe2gUp2ckThqzKUjViVB56Swsz+IQe
l7GvtTbuNcSwapfPtNHH0bWSQStfIzPZZm1A2IZ2WCYafRPkj7uibtKNgnKgIZs1197qomgXbb+b
fDx1iikgF8snJsPchukmgxkMSQtLntwbLs6H+w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UNzBll4hVdQjkp7KJChMHZ9agdKjtTu8+3O75Phz7SpwUZ73Z533+9pCfaH7QI/cwqaVREb20HXT
ji2kU1DV7+Cwbshd08hvUBl23F60ITYS+3rluBLIFX3pzXhjjSu8HQpnxXppbCODvCiWrDLqRU/y
lcFf7B+yp5jK6vEY5xuh8is/oxSPNFwip6GSMqDnE45GU6kU+6n8FTk8pAZUNKnh3j0t6YzcwS3J
wYUhnJpEQYd7+0D/NPjEz0YFqzB8WCh70MxBRJzwdXpuRLiFzplysvw+eHjMPVeU/UPKJWuwWuwc
Bfxw0ThSXZit/SSD+BGhxjbEI9T6rh66FpqbTg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
F7AZy6dB5VKzcudhyRSKWKUbVrSs4vS9jtgDkM6KrVPs3ghP3AF2TeIDyl03EesBxeIQxHqq8thx
uVIGQN5wt92jkzGo61VyUoF2dYHY2dkK9PY4bicayI6rppCS18HnyCC5ODrTMKgOpoj+PEmghCZl
j8+i3NFWPAo6M/MAtVI=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NQpRHEO/CEh2TWVl2zAKLb4TTDP4G4mQHrGzJeErDNbJ2L2B4iz3unsCjzHkoDagHoU9jeHYNzw1
EdgeGwokAwsWnHc0V18iEu5CZPPLrncpORhuc7qe0zJvoIFW4tgNZuIjFZI6bkrWzgxNYlkitGJ7
wQxgR+6ZenldybAjVF7d1R8FQmrEKWQ9ztmGHKMd9PfWD1VsbOoxbNA1tkQ3Suq2M9HDzUONaPQq
yMnGxLE4+4xTZZFVVFZeizNxqQcM1Y6s2MEUyS89U6rdAH95x9zDN8PGrif1SUWhpoz33cYp/IL8
acGyIWDbmuS0X+xsLC8cWcrO/MxKDk8bj12S7g==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
W2ZLxVMM2bO/6hqe8KRsBOYby+akb1JiKHhCv9fhS2DK483JVHKKDFtV5ZylpQSPfpmWVI6nDnNm
XtxOYqhOdd9wAHIVXly/nJQ3BORIgR42ZfKk3tkiYQd75XwTJmWjvIda5LTjKISy58Rg+7/yc6kX
SAKkQWzcaHy0VIrsbeLAK7Rz2vPrBQAwZijqUO1uD9pTa1ID2lBqRKOaN/lex50cPJ7PNmyesOUe
aisZi7+ubKWoKmZJmdUy4nKUk4a0FLkIqdFpmX+Bu5UVgWOF47nrEwh3c1MVRxWa1uvngQGGl026
FTa0G+nc1Q9KslAvMQ+fMbz+FbnTF3u/A9gizA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iimjfe3a468MWA7L84qVdX5En+Y+UcejW4CQ6QQiQBNmqZBn7m6ZOZT+b98D2KSzpbegqsBRAj53
TiMXp1/6m9g1a9lXUEMkwGgWTmaxKkTpAcGeb5iG8KFLu9WCi4Az01IoTFIS0WPCteolQQFMjX7n
y94XOEBGPzOy27XlIdUPH3SD6puFK7Z34CFUjQgQVWwJVZQO0NUHmxHL6FaAs4inPv7nTMefijcI
4hlVmOhCL8MnJUVID0tX3lkB6bwrQ6YEtZ/K1IcD1KHOwCjAbtf5FxpqdOydeCX5tT/LCQ4CpXhn
2y/MdJFbVxEcpVqJKIhS6dLjIjycHiqVUxn1LA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gymZHwiQ3bSAp2hroDRq/BHgiFMBuiMReudGJpFsOjX2l9GdrCYcIQ4Eo6B/RrhoQnrgnNV56Vil
pKDCWrE56heFTvpOCLHvLSe9ETfY11ZfzbeehELwIlK5qGbNCEUl7d7DDo0l+0ceX4EpwVdEIaUn
pqF/fIe1UUfCWwSMKrgi+6wKW3FKY6GadNsko+Qj45p/3WhlqrNJpY6iHZRIDEA/yHUenntUEV6M
N1qjJWvSHW4zQlgxAAKSQGvaSAZexfmrY5wOXnRecGDAr+h8ndeHJwPK9n8A+/imW7VDdtA0tvbv
shiq9AMz1UmghoA5fOSdcmeT/lKxV5Ruvdn9eA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12512)
`pragma protect data_block
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
P2XBWuOa1ow4/AV9uZ1GRBjcUzP2onQRsdC0+/w=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
