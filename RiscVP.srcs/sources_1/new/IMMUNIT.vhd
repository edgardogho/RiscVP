----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      Generates IMMEDIATEs based on the instruction type (S,I,U,B,J)
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity IMMUNIT is
    Port ( INSTRUCTION : in STD_LOGIC_VECTOR (31 downto 0);
           IMMEDIATE : out STD_LOGIC_VECTOR (31 downto 0));
end IMMUNIT;

architecture Behavioral of IMMUNIT is


signal STYPE: STD_LOGIC;
signal ITYPE: STD_LOGIC;
signal UTYPE: STD_LOGIC;
signal BTYPE: STD_LOGIC;
signal JTYPE: STD_LOGIC;
signal SBTYPE: STD_LOGIC;
signal SITYPE: STD_LOGIC;
signal JITYPE: STD_LOGIC;
signal JUTYPE: STD_LOGIC;
signal SBITYPE: STD_LOGIC;
signal NOTUTYPE: STD_LOGIC;
signal NOTJUTYPE: STD_LOGIC;
signal OPCODE : STD_LOGIC_VECTOR(6 downto 0);

begin
OPCODE <= Instruction(6 downto 0);
    STYPE <= '1' when OPCODE="0100011" else '0';  
    ITYPE <= '1' when OPCODE="1100111" OR OPCODE="0000011" OR OPCODE="0010011" ELSE '0';
    UTYPE <= '1' when OPCODE="0110111" OR OPCODE="0010111" ELSE '0';
    BTYPE <= '1' when OPCODE="1100011" ELSE '0';
    JTYPE <= '1' when OPCODE="1101111" ELSE '0';    
    SBTYPE <= STYPE OR BTYPE;
    
    JITYPE <= JTYPE OR ITYPE;
    
    SITYPE <= STYPE OR ITYPE;
    
    SBITYPE <= STYPE OR BTYPE OR ITYPE;
    
    JUTYPE <= JTYPE OR UTYPE;
    
    NOTJUTYPE <= NOT( JTYPE OR UTYPE);
    
    NOTUTYPE <= NOT UTYPE;


    IMMEDIATE(0) <= ( INSTRUCTION(7) AND STYPE) OR (INSTRUCTION(20) AND ITYPE);
    IMMEDIATE(1) <= ( INSTRUCTION(8) AND SBTYPE) OR (INSTRUCTION(21) AND JITYPE);
    IMMEDIATE(2) <= ( INSTRUCTION(9) AND SBTYPE) OR (INSTRUCTION(22) AND JITYPE);
    IMMEDIATE(3) <= ( INSTRUCTION(10) AND SBTYPE) OR (INSTRUCTION(23) AND JITYPE);
    IMMEDIATE(4) <= ( INSTRUCTION(11) AND SBTYPE) OR (INSTRUCTION(24) AND JITYPE);
    
    IMMEDIATE(5) <= INSTRUCTION(25) AND NOTUTYPE;
    IMMEDIATE(6) <= INSTRUCTION(26) AND NOTUTYPE;
    IMMEDIATE(7) <= INSTRUCTION(27) AND NOTUTYPE;
    IMMEDIATE(8) <= INSTRUCTION(28) AND NOTUTYPE;
    IMMEDIATE(9) <= INSTRUCTION(29) AND NOTUTYPE;
    IMMEDIATE(10) <= INSTRUCTION(30) AND NOTUTYPE;
    
    IMMEDIATE(11) <= ( ( INSTRUCTION(31) AND SITYPE) OR (INSTRUCTION(7) AND BTYPE) OR (INSTRUCTION(20) AND JTYPE) ) AND NOTUTYPE;
    IMMEDIATE(12) <= ( INSTRUCTION(31) AND SBITYPE) OR (INSTRUCTION(12) AND JUTYPE);
    
    IMMEDIATE(13) <= ( INSTRUCTION(13) AND JUTYPE) OR (INSTRUCTION(31) AND NOTJUTYPE);
    IMMEDIATE(14) <= ( INSTRUCTION(14) AND JUTYPE) OR (INSTRUCTION(31) AND NOTJUTYPE);
    IMMEDIATE(15) <= ( INSTRUCTION(15) AND JUTYPE) OR (INSTRUCTION(31) AND NOTJUTYPE);
    IMMEDIATE(16) <= ( INSTRUCTION(16) AND JUTYPE) OR (INSTRUCTION(31) AND NOTJUTYPE);
    IMMEDIATE(17) <= ( INSTRUCTION(17) AND JUTYPE) OR (INSTRUCTION(31) AND NOTJUTYPE);
    IMMEDIATE(18) <= ( INSTRUCTION(18) AND JUTYPE) OR (INSTRUCTION(31) AND NOTJUTYPE);
    IMMEDIATE(19) <= ( INSTRUCTION(19) AND JUTYPE) OR (INSTRUCTION(31) AND NOTJUTYPE);
    
    IMMEDIATE(20) <= ( INSTRUCTION(20) AND UTYPE) OR (INSTRUCTION(31) AND NOTUTYPE);
    IMMEDIATE(21) <= ( INSTRUCTION(21) AND UTYPE) OR (INSTRUCTION(31) AND NOTUTYPE);
    IMMEDIATE(22) <= ( INSTRUCTION(22) AND UTYPE) OR (INSTRUCTION(31) AND NOTUTYPE);
    IMMEDIATE(23) <= ( INSTRUCTION(23) AND UTYPE) OR (INSTRUCTION(31) AND NOTUTYPE);
    IMMEDIATE(24) <= ( INSTRUCTION(24) AND UTYPE) OR (INSTRUCTION(31) AND NOTUTYPE);
    IMMEDIATE(25) <= ( INSTRUCTION(25) AND UTYPE) OR (INSTRUCTION(31) AND NOTUTYPE);
    IMMEDIATE(26) <= ( INSTRUCTION(26) AND UTYPE) OR (INSTRUCTION(31) AND NOTUTYPE);
    IMMEDIATE(27) <= ( INSTRUCTION(27) AND UTYPE) OR (INSTRUCTION(31) AND NOTUTYPE);
    IMMEDIATE(28) <= ( INSTRUCTION(28) AND UTYPE) OR (INSTRUCTION(31) AND NOTUTYPE);
    IMMEDIATE(29) <= ( INSTRUCTION(29) AND UTYPE) OR (INSTRUCTION(31) AND NOTUTYPE);
    IMMEDIATE(30) <= ( INSTRUCTION(30) AND UTYPE) OR (INSTRUCTION(31) AND NOTUTYPE);
    IMMEDIATE(31) <= INSTRUCTION(31);


end Behavioral;
