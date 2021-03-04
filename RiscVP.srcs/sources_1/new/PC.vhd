----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      This is the simply a wrapper for a LATCH32
--      Using it so simulation names clearly identify PC
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PC is
    Port ( PC_IN : in STD_LOGIC_VECTOR(31 downto 0);
           PC_OUT : out STD_LOGIC_VECTOR(31 downto 0);
           PC_Clk : in STD_LOGIC;
           PC_Reset : in STD_LOGIC);
end PC;

architecture Behavioral of PC is
COMPONENT LATCH32
    Port ( LATCH32_IN : in STD_LOGIC_VECTOR (31 downto 0);
           LATCH32_OUT : out STD_LOGIC_VECTOR (31 downto 0);
           LATCH32_Clock : in STD_LOGIC;
           LATCH32_Reset : in STD_LOGIC);
END COMPONENT;
begin

U0: LATCH32 Port Map (LATCH32_IN=>PC_IN,LATCH32_OUT=>PC_OUT,LATCH32_Clock=>PC_Clk,LATCH32_Reset=>PC_Reset);


end Behavioral;
