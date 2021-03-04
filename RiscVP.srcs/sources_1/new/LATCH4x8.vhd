----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      Simple 32 bit Latch with Byte-level Write support.
--      Used for WriteByte, Write HalfWord, Write Word instructions that need
--      to be able to write a single byte, 2 bytes, 3 bytes or 4 bytes only.
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LATCH4x8 is
    Port ( LATCH4x8_IN : in STD_LOGIC_VECTOR (31 downto 0);
           LATCH4x8_OUT : out STD_LOGIC_VECTOR (31 downto 0);
           LATCH4x8_Reset : in STD_LOGIC;
           LATCH4x8_Clock : in STD_LOGIC_VECTOR (3 downto 0));
end LATCH4x8;

architecture Behavioral of LATCH4x8 is
COMPONENT LATCH8
 Port ( LATCH8_IN : in STD_LOGIC_VECTOR (7 downto 0);
           LATCH8_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           LATCH8_Clock : in STD_LOGIC;
           LATCH8_Reset : in STD_LOGIC);
END COMPONENT;
begin

U0: LATCH8 Port Map(LATCH8_IN=>LATCH4x8_IN(7 downto 0), LATCH8_OUT=>LATCH4x8_OUT(7 downto 0),LATCH8_Reset=>LATCH4x8_Reset,LATCH8_Clock=>LATCH4x8_Clock(0));
U1: LATCH8 Port Map(LATCH8_IN=>LATCH4x8_IN(15 downto 8), LATCH8_OUT=>LATCH4x8_OUT(15 downto 8),LATCH8_Reset=>LATCH4x8_Reset,LATCH8_Clock=>LATCH4x8_Clock(1));
U2: LATCH8 Port Map(LATCH8_IN=>LATCH4x8_IN(23 downto 16), LATCH8_OUT=>LATCH4x8_OUT(23 downto 16),LATCH8_Reset=>LATCH4x8_Reset,LATCH8_Clock=>LATCH4x8_Clock(2));
U3: LATCH8 Port Map(LATCH8_IN=>LATCH4x8_IN(31 downto 24), LATCH8_OUT=>LATCH4x8_OUT(31 downto 24),LATCH8_Reset=>LATCH4x8_Reset,LATCH8_Clock=>LATCH4x8_Clock(3));



end Behavioral;
