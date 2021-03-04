----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      This unit aligns data from MEMIOUNIT
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LoadAlignmentUnit is
    Port ( LA_AlignedData : out STD_LOGIC_VECTOR (31 downto 0);
           LA_UnalignedData : in STD_LOGIC_VECTOR (31 downto 0);
           LA_Shamt : in STD_LOGIC_VECTOR (1 downto 0);
           LA_LNotR : in STD_LOGIC;
           LA_LatchWrite : in STD_LOGIC_VECTOR (3 downto 0);
           LA_LatchMuxSel : in STD_LOGIC;
           LA_SizeAdj : in STD_LOGIC_VECTOR (2 downto 0);
           reset : in STD_LOGIC);
end LoadAlignmentUnit;

architecture Behavioral of LoadAlignmentUnit is
COMPONENT BarrelShifterRight32 
Port (     DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           shift : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0);
           Arith : in STD_LOGIC);
end COMPONENT;
COMPONENT BarrelShifterLeft32 
    Port ( DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           shift : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

signal BarrelShifterData : STD_LOGIC_VECTOR (31 downto 0);
signal LeftShifterData : STD_LOGIC_VECTOR (31 downto 0);
signal RightShifterData : STD_LOGIC_VECTOR (31 downto 0);

COMPONENT LATCH4x8 
    Port ( LATCH4x8_IN : in STD_LOGIC_VECTOR (31 downto 0);
           LATCH4x8_OUT : out STD_LOGIC_VECTOR (31 downto 0);
           LATCH4x8_Reset : in STD_LOGIC;
           LATCH4x8_Clock : in STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

signal latchData : STD_LOGIC_VECTOR (31 downto 0);
signal completeData : STD_LOGIC_VECTOR(31 downto 0);

signal byteSign : STD_LOGIC;
signal halfSign : STD_LOGIC;

signal loadByte : STD_LOGIC_VECTOR(31 downto 0);
signal loadHalf : STD_LOGIC_VECTOR(31 downto 0);

signal shiftAmt : STD_LOGIC_vector(4 downto 0);

begin

shiftAmt<= LA_Shamt(1) & LA_Shamt(0) & "000";
--First stage, barrel shifters
U0: BarrelShifterRight32 Port Map( DataIN=>LA_UnalignedData,shift=>shiftAmt,DataOut=>RightShifterData ,Arith=>'0');
U1: BarrelShifterLeft32 Port Map( DataIN=>LA_UnalignedData,shift=>shiftAmt, DataOut=>LeftShifterData); 
BarrelShifterData <= LeftShifterData when LA_LNotR='1' else RightShifterData;

--Second Stage, Latch (independent byte control) and mux
U2: LATCH4x8 Port Map(LATCH4x8_IN=>BarrelShifterData,LATCH4x8_OUT=>latchData,LATCH4x8_Reset=>reset,LATCH4x8_Clock=>LA_LatchWrite);
completeData <= latchData when LA_LatchMuxSel='1' else BarrelshifterData;

--Last Stage, do the sign magic
byteSign<=completeData(7) when LA_SizeAdj(2)='0' else '0';
halfSign<=completeData(15) when LA_SizeAdj(2)='0' else '0';

--Now create signals for  LH and LB
loadByte(7 downto 0) <= completeData(7 downto 0);
GenByte : for i in 31 downto 8 generate
    loadByte(i)<=byteSign;
end generate;

loadHalf(15 downto 0) <= completeData(15 downto 0);
GenHalf : for i in 31 downto 16 generate
    loadHalf(i)<=halfSign;
end generate;

LA_AlignedData<= loadByte WHEN LA_SizeAdj(1 downto 0)="01" else
                 loadHalf WHEN LA_SizeAdj(1 downto 0)="10" else
                 completeData;


end Behavioral;
