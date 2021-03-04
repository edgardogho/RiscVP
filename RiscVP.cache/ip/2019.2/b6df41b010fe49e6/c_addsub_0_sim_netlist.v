// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Thu Jan 21 15:47:51 2021
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
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 add_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME add_intf, LAYERED_METADATA undef" *) input ADD;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [31:0]S;

  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
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
  (* C_HAS_CE = "0" *) 
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
        .CE(1'b1),
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
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
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
  (* C_HAS_CE = "0" *) 
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
        .CE(1'b0),
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
S8GRzXcyArEO0X2yEpayRX+oiqL7uwShGrEUs+qwbL9AJXbIsm6BLB0a/ExD7ZXepCnUoevk2ube
fpDzHGV7zoOj+uPO72vmDJgWknOecudPsYZkd2am3OC55J7hCG68VByQgjBg7gm8ywkWuTaJyRJN
UPof3cG55dcwUEc/fiik/fDiDMu3tlcp9IyjY6GkSkp6eH2gX4tghrI3+ttFJFktbQTU2b6IfKNe
+Mwp/eJPXXdimWcXI7CkIIymzILkRcj6M1s2Cs767aml9g2fD1yy7B89Vrr22n9gKCWx1C/Hr5do
qrmzhZdzq3yjASgtFGw9ceBwzpqhes3vu8NjCA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
yNCMHslaEP18ptHTdHjXQyabFKDBkZE6JuGMKxI1McAO+gQIysARQJaFbNJUzWgUCCBIBgWE/DNs
bNGfc2qucuy4OHXPLgsULsz0YbHwN8A4xXVLxO7OPbODJ3CoDf4Ot9ZkTmMqp29G2lCKkKaotMic
zKy39MIwDdXDYeOfZ9r7IdJ6vRX6lz2WP4r2XkAJLpkG+g62C238TPSQOxRTX4TC4tVGy5iMwAz0
g8QUCzkgvL2mOD+3bmWQ48LPmo7SkbwTQc9EN6oz1JuGX+dlqLdLt8YpiE32GyW5Jq10dNbjYiJM
TOHH6RYeIsLar+H7AXOmJ325rpXWYDvJkur2Ew==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12032)
`pragma protect data_block
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
crJFb8M=
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
