----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      Generates either a 0x01 or 0x00 depending if the instruction is 
--      Set Less Than or Set Less Than Unsigned.
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SetUnit is
    Port ( SU_lt : in STD_LOGIC;
           SU_ltu : in STD_LOGIC;
           SU_unsig : in stD_logic; --Connected to Instruction(12) since ltu has Instruction(12)=1
           SU_Data : out STD_LOGIC_VECTOR (31 downto 0));
end SetUnit;

architecture Behavioral of SetUnit is

begin
SU_Data(31 downto 1) <= "0000000000000000000000000000000";
SU_Data(0) <= (not SU_unsig AND SU_lt) OR (SU_unsig AND SU_ltu);

end Behavioral;
