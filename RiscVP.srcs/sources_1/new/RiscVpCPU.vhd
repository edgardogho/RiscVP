----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      This is the Top Level CPU connected to GPIO Devices (Led/Switches)
--      Implements BLOCKRAM to hold Instructions
--      Implements BLOCKRAM as scratchpad RAM
--      Implements 2 Latches for GPIO
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RiscVpCPU is
    Port ( switches : in STD_LOGIC_VECTOR (7 downto 0);
           clock : in std_logic;
           NotReset : in std_logic;
           leds : out STD_LOGIC_VECTOR (7 downto 0));
end RiscVpCPU;

architecture Behavioral of RiscVpCPU is

COMPONENT ControlUnit
PORT(
           Instruction : in STD_LOGIC_VECTOR (31 downto 0);
           Reset : in std_logic;
           MasterClock : in std_logic;
           ALU_CCR: in STD_LOGIC_VECTOR(5 downto 0);
           ALU_RES: in STD_LOGIC_VECTOR(1 downto 0);
           ALU_AMuxSel : out std_logic;
           ALU_BMuxSel : out std_logic;
           ALU_OP: out STD_LOGIC_VECTOR (3 downto 0);
           ALU_ADD4MuxSel : out STD_LOGIC; 
           INST_Clk : out std_logic;
           PC_JumpMuxSel : out STD_LOGIC;
           PC_JARLMuxSel : out STD_LOGIC;
           PC_Clk : out STD_LOGIC;
           REG_WriteMuxSel : out STD_LOGIC_VECTOR(1 downto 0);
           REG_WriteClk: out std_logic;
           MEMIO_Clk : out std_logic;
           MEMIO_Write :out std_logic_vector(3 downto 0);
           LA_LatchWrite : out std_logic_Vector(3 downto 0);
           LA_LatchMuxSel : out std_logic;
           LA_SizeAdj : out std_logic_vector(2 downto 0);
           SALA_LNotR: out std_logic;
           SALA_Shamt : out std_logic_vector(1 downto 0)
           );
END COMPONENT;


COMPONENT RegisterFile
PORT(
           REG_RS1 : in STD_LOGIC_VECTOR (4 downto 0);
           REG_RS2 : in STD_LOGIC_VECTOR (4 downto 0);
           REG_RD : in STD_LOGIC_VECTOR (4 downto 0);
           REG_S1 : out STD_LOGIC_VECTOR (31 downto 0);
           REG_S2 : out STD_LOGIC_VECTOR (31 downto 0);
           REG_Data : in STD_LOGIC_VECTOR (31 downto 0);
           reset : in std_logic;
           REG_WriteClk : in STD_LOGIC);
END COMPONENT;

COMPONENT ALU
PORT(
           ALU_A : in STD_LOGIC_VECTOR (31 downto 0);
           ALU_B : in STD_LOGIC_VECTOR (31 downto 0);
           ALU_CIN : in STD_LOGIC;
           ALU_RES : out STD_LOGIC_VECTOR (31 downto 0);
           ALU_OP : in STD_LOGIC_VECTOR (3 downto 0);
           ALU_CCR : out STD_LOGIC_VECTOR(5 downto 0) );
END COMPONENT;

COMPONENT IMMUNIT
PORT(
           INSTRUCTION : in STD_LOGIC_VECTOR (31 downto 0);
           IMMEDIATE : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;


COMPONENT PC
Port ( 
           PC_IN : in STD_LOGIC_VECTOR (31 downto 0);
           PC_OUT : out STD_LOGIC_VECTOR (31 downto 0);
           PC_Reset : in std_logic;
           PC_Clk : in STD_LOGIC);
END COMPONENT;




COMPONENT PCADDER
PORT(
           A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           S : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;

signal PC_PLUS4 : STD_LOGIC_VECTOR(31 downto 0);


COMPONENT JumpAdder 
PORT (
           A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           S : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END COMPONENT;



COMPONENT MEMIOUNIT
    Port ( MEMIO_DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           MEMIO_DataOut : out STD_LOGIC_VECTOR (31 downto 0);
           MEMIO_Clk : in STD_LOGIC;
           MEMIO_Reset : in STD_LOGIC;
           MEMIO_Address : in STD_LOGIC_VECTOR (31 downto 0);
           MEMIO_GPI : in STD_LOGIC_VECTOR (7 downto 0);
           MEMIO_GPO : out STD_LOGIC_VECTOR (7 downto 0);
           MEMIO_Write : in STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;




COMPONENT LoadAlignmentUnit
    Port ( LA_AlignedData : out STD_LOGIC_VECTOR (31 downto 0);
           LA_UnalignedData : in STD_LOGIC_VECTOR (31 downto 0);
           LA_Shamt : in STD_LOGIC_VECTOR (1 downto 0);
           LA_LNotR : in STD_LOGIC;
           LA_LatchWrite : in STD_LOGIC_VECTOR (3 downto 0);
           LA_LatchMuxSel : in STD_LOGIC;
           LA_SizeAdj : in STD_LOGIC_VECTOR (2 downto 0);
           reset : in STD_LOGIC);
end COMPONENT;


COMPONENT StoreAlignmentUnit
    Port ( SA_UnalignedData : in STD_LOGIC_VECTOR (31 downto 0);
           SA_AlignedData : out STD_LOGIC_VECTOR (31 downto 0);
           SA_LNotR : in STD_LOGIC;
           SA_Shamt : in STD_LOGIC_VECTOR (1 downto 0));
end COMPONENT;


COMPONENT InstructionMem
Port ( 
           IM_Address : in STD_LOGIC_VECTOR (31 downto 0);
           IM_Clock : in STD_LOGIC;
           Instruction : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

signal instruction : std_logic_Vector(31 downto 0);
signal INST_Clk : std_logic;


COMPONENT SetUnit
Port ( 
           SU_lt : in STD_LOGIC;
           SU_ltu : in STD_LOGIC;
           SU_unsig : in stD_logic;
           SU_Data : out STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

signal SetUnit_data : std_logic_vector(31 downto 0);


--Signals
signal REG_S1: STD_LOGIC_VECTOR(31 downto 0); --Output S1 from REG
signal REG_S2: STD_LOGIC_VECTOR(31 downto 0); --Output S2 from REG
signal REG_Data: STD_LOGIC_VECTOR(31 downto 0); --Input Data to REG 
signal REG_WriteClk: std_logic; --Input Clock for Write
signal REG_WriteMuxSel : STD_LOGIC_vector(1 downto 0); --Mux Sel for Data

signal ALU_A : STD_LOGIC_VECTOR (31 downto 0);
signal ALU_B : STD_LOGIC_VECTOR (31 downto 0);
signal ALU_RES: STD_LOGIC_VECTOR(31 downto 0);
signal ALU_OP : STD_LOGIC_VECTOR(3 downto 0);
signal ALU_CCR: STD_LOGIC_VECTOR(5 downto 0);
signal ALU_BMuxSel : STD_LOGIC;
signal ALU_AMuxSel : STD_LOGIC;
signal ALU_ADD4MuxSel : std_logic;
signal Alu_PLUS4 : STD_LOGIC_VECTOR(31 downto 0);
signal ALU_ADDRESS : STD_LOGIC_VECTOR(31 downto 0);

signal IMMEDIATE : STD_LOGIC_VECTOR(31 downto 0);

signal PC_IN : STD_LOGIC_VECTOR(31 downto 0);
signal PC_OUT : STD_LOGIC_VECTOR(31 downto 0);
signal PC_Clk : STD_LOGIC;


signal JA_B : STD_LOGIC_VECTOR(31 downto 0);
signal PC_JumpMuxSel: STD_LOGIC;
signal JA_Out: STD_LOGIC_VECTOR(31 downto 0);
signal PC_JARLMuxSel : std_logic;


signal MEMIO_Clk : std_logic;
signal MEMIO_Write: STD_LOGIC_VECTOR(3 downto 0);
signal MEMIO_DataOut : STD_LOGIC_VECTOR(31 downto 0);

signal LA_AlignedData : STD_LOGIC_VECTOR (31 downto 0);
signal LA_LatchWrite : STD_LOGIC_VECTOR( 3 downto 0);
signal LA_LatchMuxSel : STD_LOGIC;
signal LA_SizeAdj : STD_LOGIC_VECTOR(2 downto 0);

signal SA_AlignedData: STD_LOGIC_VECTOR(31 downto 0);
signal SALA_LNotR : std_logic;
signal SALA_SHAMT : STD_LOGIC_VECTOR(1 downto 0);


begin


--Control unit is U0
U0: ControlUnit Port Map(
           Instruction => Instruction ,
           Reset => NotReset,
           MasterClock => Clock,
           ALU_CCR => ALU_CCR ,
           ALU_RES => ALU_ADDRESS(1 downto 0),
           ALU_AMuxSel => ALU_AMuxSel,
           ALU_BMuxSel => ALU_BMuxSel,
           ALU_OP => ALU_OP,
           ALU_ADD4MuxSel => ALU_ADD4MuxSel, 
           INST_Clk => INST_Clk,
           PC_JumpMuxSel => PC_JumpMuxSel,
           PC_JARLMuxSel => PC_JARLMuxSel,
           PC_Clk => PC_CLK,
           REG_WriteMuxSel => REG_WriteMuxSel,
           REG_WriteClk => REG_WriteClk,
           MEMIO_Clk => MEMIO_Clk,
           MEMIO_Write => MEMIO_Write,
           LA_LatchWrite => LA_LatchWrite,
           LA_LatchMuxSel => LA_LatchMuxSel ,
           LA_SizeAdj => LA_SizeAdj,
           SALA_LNotR => SALA_LNotR,
           SALA_Shamt => SALA_SHAMT
);

--Do the PC handling in here
U1: PC Port Map(
    PC_IN=> PC_IN,
    PC_Out=> PC_OUT,
    PC_Reset=> Notreset,
    PC_Clk => PC_Clk
);
--Pc output goes both to INST MEM and PC+4 Adder
U2: PCADDER Port Map(
    A=> PC_OUT,
    S=> PC_PLUS4
);

U3: JumpAdder Port Map(
    A=> PC_OUT,
    B=> JA_B,
    S=> JA_OUT
);
--MUX: Selects if JA_B points to IMMEDIATE or X"00000004"
JA_B <= IMMEDIATE when PC_JumpMuxSel='1' else X"00000004";

--MUX: Selects if PC_IN points to ALU_RES or JUMP_ADDER_OUT
PC_IN<= ALU_RES when PC_JARLMuxSel='1' else JA_OUT;

--Instruction Memory
U4: InstructionMem Port Map(
    IM_Address=> PC_OUT,
    IM_Clock=> INST_Clk,
    Instruction=>Instruction
);

--Immediate generator
U5: IMMUnit Port Map(
    INSTRUCTION=> Instruction,
    IMMEDIATE => IMMEDIATE
);

--Alu and Alu selector for B
U6: ALU Port Map(
    ALU_A => ALU_A,
    ALU_B => ALU_B,
    ALU_CIN => '0',
    ALU_RES=> ALU_RES,
    ALU_OP => ALU_OP,
    ALU_CCR => ALU_CCR
);
ALU_B <= IMMEDIATE when ALU_BMuxSel='1' else REG_S2;
ALU_A <= PC_OUT when ALU_AMuxSel='1' else REG_S1;




U7: MEMIOUNIT Port Map(
           MEMIO_DataIn =>SA_AlignedData,
           MEMIO_DataOut => MEMIO_DataOut,
           MEMIO_Clk => MEMIO_Clk,
           MEMIO_Reset => NotReset,
           MEMIO_Address => ALU_ADDRESS,
           MEMIO_GPI => switches,
           MEMIO_GPO => leds,
           MEMIO_Write => MEMIO_Write

);


U8: RegisterFile Port Map(
    REG_RS1=> Instruction(19 downto 15),
    REG_RS2=> Instruction(24 downto 20),
    REG_RD => Instruction(11 downto 7),
    REG_S1 => Reg_s1,
    REG_S2 => Reg_s2,
    REG_Data => Reg_Data,
    reset => Notreset,
    REG_WriteClk=> REG_WriteClk
);

With REG_WriteMuxSel select 
Reg_Data <=
    ALU_RES when "00",
    LA_ALignedData when "01",
    PC_PLUS4 when "10",
    SetUnit_data when others;

U9: SetUnit Port Map(
    SU_lt => ALU_CCR(3),
    SU_ltu=> ALU_CCR(1),
    SU_unsig => Instruction(12),
    SU_Data=> SetUnit_data
);

UA: PCADDER Port Map( A=> ALU_RES, S=>ALU_PLUS4 );

ALU_ADDRESS<= ALU_PLUS4 when ALU_ADD4MuxSel='1' else ALU_RES;

UB: LoadAlignmentUnit Port Map(
           LA_AlignedData => LA_AlignedData,
           LA_UnalignedData => MEMIO_DataOut,
           LA_Shamt => SALA_Shamt,
           LA_LNotR =>SALA_LNotR,
           LA_LatchWrite => LA_LatchWrite,
           LA_LatchMuxSel => LA_LatchMuxSel,
           LA_SizeAdj => LA_SizeAdj,
           reset => Notreset);
           
           
UC: StoreAlignmentUnit Port Map(
           SA_UnalignedData => REG_S2 ,
           SA_AlignedData => SA_AlignedData ,
           SA_LNotR => SALA_LNotR,
           SA_SHAMT => SALA_SHAMT
);



end Behavioral;
