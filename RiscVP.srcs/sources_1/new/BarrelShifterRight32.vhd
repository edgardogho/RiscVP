----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      Right Barrel Shifter supports Logical and Arith shift by 32
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity BarrelShifterRight32 is
    Port ( DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           shift : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0);
           Arith : in STD_LOGIC);
end BarrelShifterRight32;

architecture Behavioral of BarrelShifterRight32 is
signal shift1_aux : std_logic_vector(31 downto 0);
signal shift2_aux : std_logic_vector(31 downto 0);
signal shift4_aux : std_logic_vector(31 downto 0);
signal shift8_aux : std_logic_vector(31 downto 0);

signal pad : std_logic;
begin
--If Arith=1 then keep sign bit
pad <= DataIn(31) when Arith='1' else '0';

shift1_aux(31) <= pad when shift(0)='1' else DataIn(31);
barrel_level1: for i in 30 downto 0 generate
shift1_aux(i) <= DataIn(i+1) when shift(0)='1' else DataIn(i);
end generate;


shift2_aux(31) <= pad when shift(1)='1' else shift1_aux(31);
shift2_aux(30) <= pad when shift(1)='1' else shift1_aux(30);
barrel_level2: for i in 29 downto 0 generate
shift2_aux(i) <= shift1_aux(i+2) when shift(1)='1' else shift1_aux(i);
end generate;

barrel_level3_a: for i in 31 downto 28 generate
shift4_aux(i)  <= pad when shift(2)='1' else shift2_aux(i);
end generate;
barrel_level3_b: for i in 27 downto 0 generate
shift4_aux(i) <= shift2_aux(i+4) when shift(2)='1' else shift2_aux(i);
end generate;

barrel_level4_a: for i in 31 downto 24 generate
shift8_aux(i) <= pad when shift(3)='1' else shift4_aux(i);
end generate;
barrel_level4_b: for i in 23 downto 0 generate
shift8_aux(i) <= shift4_aux(i+8) when shift(3)='1' else shift4_aux(i);
end generate;

barrel_level5_a: for i in 31 downto 16 generate
DataOut(i) <= pad when shift(4)='1' else shift8_aux(i);
end generate;
barrel_level5_b: for i in 15 downto 0 generate
DataOut(i) <= shift8_aux(i+16) when shift(4)='1' else shift8_aux(i);
end generate;


end Behavioral;
