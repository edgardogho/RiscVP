----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      Left Barrel Shifter supports shift by 32
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifterLeft32 is
    Port ( DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           shift : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end BarrelShifterLeft32;

architecture Behavioral of BarrelShifterLeft32 is
signal shift1_aux : std_logic_vector(31 downto 0);
signal shift2_aux : std_logic_vector(31 downto 0);
signal shift4_aux : std_logic_vector(31 downto 0);
signal shift8_aux : std_logic_vector(31 downto 0);
begin

-- First level will shift by 1 using shift(0)

shift1_aux(0) <= DataIn(0) when shift(0)='0' else '0';
barrel_level1: for i in 1 to 31 generate
shift1_aux(i) <= DataIn(i) when shift(0)='0' else DataIn(i-1);
end generate;

-- Second level will shift by 2 using shift(1)
shift2_aux(0) <= shift1_aux(0) when shift(1)='0' else '0';
shift2_aux(1) <= shift1_aux(1) when shift(1)='0' else '0';
barrel_level2: for i in 2 to 31 generate
shift2_aux(i) <= shift1_aux(i) when shift(1)='0' else shift1_aux(i-2);
end generate;

--Third level will shift by 4 using shift(2)
barrel_level3_a: for i in 0 to 3 generate
shift4_aux(i) <= shift2_aux(i) when shift(2)='0' else '0';
end generate;
barrel_level3_b: for i in 4 to 31 generate
shift4_aux(i) <= shift2_aux(i) when shift(2)='0' else shift2_aux(i-4);
end generate;

--Fourth level will shift by 8 using shift(3)
barrel_level4_a: for i in 0 to 7 generate
shift8_aux(i) <= shift4_aux(i) when shift(3)='0' else '0';
end generate;
barrel_level4_b: for i in 8 to 31 generate
shift8_aux(i) <= shift4_aux(i) when shift(3)='0' else shift4_aux(i-8);
end generate;

--Fifth level will shift by 16 using shift(4)
barrel_level5_a: for i in 0 to 15 generate
DataOut(i) <= shift8_aux(i) when shift(4)='0' else '0';
end generate;

barrel_level5_b: for i in 16 to 31 generate
DataOut(i) <= shift8_aux(i) when shift(4)='0' else shift8_aux(i-16);
end generate;

end Behavioral;
