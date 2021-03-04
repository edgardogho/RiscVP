----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2021 03:23:05 PM
-- Design Name: 
-- Module Name: RISCVPCPUTB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RISCVPCPUTB is
end RISCVPCPUTB;

architecture Behavioral of RISCVPCPUTB is
COMPONENT RiscVpCPU
    Port ( switches : in STD_LOGIC_VECTOR (7 downto 0);
           clock : in std_logic;
           Notreset : in std_logic;
           leds : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;
signal switches : STD_LOGIC_VECTOR(7 downto 0);
signal clock : std_logic;
signal Notreset : std_logic;
signal leds : stD_logic_vector(7 downto 0);
begin

U1: RiscVpCPU Port Map(switches,clock,Notreset,leds);

P0 : process 
    begin
     Clock <= '0';
     wait for 5ns;
     Clock <= '1';
     wait for 5ns;
end process;

P1: Process
begin
    switches <= "01010101";
    Notreset<='0';
    wait for 20ns;
    Notreset<='1';
    wait for 10000ns;
end process;


end Behavioral;
