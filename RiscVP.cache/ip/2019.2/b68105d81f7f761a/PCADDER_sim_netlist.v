// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Thu Jan 21 15:46:06 2021
// Host        : oryxpro running 64-bit Pop!_OS 20.04 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ PCADDER_sim_netlist.v
// Design      : PCADDER
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "PCADDER,c_addsub_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_14,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    CLK,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [31:0]S;

  wire [31:0]A;
  wire CLK;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "1" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "100" *) 
  (* C_B_WIDTH = "3" *) 
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
        .ADD(1'b1),
        .B({1'b0,1'b0,1'b0}),
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

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "1" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "100" *) 
(* C_B_WIDTH = "3" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
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
  input [2:0]B;
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
  wire CLK;
  wire [31:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "1" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "100" *) 
  (* C_B_WIDTH = "3" *) 
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
        .B({1'b0,1'b0,1'b0}),
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
IoAMjZq2m1bOySE+Ai0/nV/laiHRkRBOxR2oZO9/i4HdA4irW6AzutxGvnzTPM8MuaVNkZgjYbDb
E45Zx6WUkSah83j6IPxmaTPcISqs6bn2b7fwfvWPl7UUyVcXRpmwbMWLZ5f7frOy8VPVM9YeEoyw
NogCKxRMbFYvt86dO4BZPiX/HPwaEFxoxZFoneyCjba6nKJKkW1aeINsjflzFfK4htqAS4HUl1f2
Wte6Cpqv7KzymwzquPPvtV8iX7Dzx3eSKrat5+Wmi4s3H2vu4VERG0bc9APQypVDWw70h/U76yQV
SeCCmyvFbSbhkLEYmE1y7aHHaYfTRsLIw2wf5Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rTAUpSXnQ6gMqN8LrDM6J8ayfL1zrajmfSjhJQSn/VeRMiwO5dvRgNAtMxjCIQiU3M2bC9yhYBT8
eqCJ0WY1piLx+gbR5SYwkuVNjx8OgLO/7d7RHZ6scsz3M/JW6cU2fpG8YuALGa2VWzzu2O/hdXxj
F18Zozi6cPOOa+Fy0xMCdHWDlr7cbwXrdu5X2aAFODyNkuDucNwi3CbPz5Y4gSgm/4aiaoa0raXt
3Kukmlyy9icaWzUdvWY2wP5uUjJgLBc6H/12rj3T7rN+aBEjXZa56vz6KefZ9ySnfxASjx7XILyQ
KBPfa53XD/LLuf/DG79YAEFAqUiZUZ6KCcFlYQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11552)
`pragma protect data_block
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
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
