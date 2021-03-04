----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      Simple 32 bit latch with a single Clock/Write signal
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LATCH32 is
    Port ( Latch32_IN : in STD_LOGIC_VECTOR (31 downto 0);
           Latch32_OUT : out STD_LOGIC_VECTOR (31 downto 0);
           Latch32_Reset: in stD_logic;
           Latch32_Clock : in STD_LOGIC);
end LATCH32;

architecture Behavioral of LATCH32 is

begin
 process(Latch32_Clock,Latch32_Reset)
 begin
    if (Latch32_Reset='0') then
        Latch32_OUT<=X"00000000";
    elsif (rising_edge(Latch32_Clock)) then
        Latch32_OUT <= Latch32_IN;
    end if;
 end process;


end Behavioral;
