----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      Simple 8 bit latch
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LATCH8 is
    Port ( LATCH8_IN : in STD_LOGIC_VECTOR (7 downto 0);
           LATCH8_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           LATCH8_Clock : in STD_LOGIC;
           LATCH8_Reset : in STD_LOGIC);
end LATCH8;

architecture Behavioral of LATCH8 is

begin

 process(Latch8_Clock,Latch8_Reset)
 begin
    if (Latch8_Reset='0') then
        Latch8_OUT<=X"00";
    elsif (rising_edge(Latch8_Clock)) then
        Latch8_OUT <= Latch8_IN;
    end if;
 end process;


end Behavioral;
