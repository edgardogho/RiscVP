----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      RISC-V Register File
--      ToDo: Rewrite using 2D array for signals and generate
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RegisterFile is
    Port ( REG_RS1 : in STD_LOGIC_VECTOR (4 downto 0);
           REG_RS2 : in STD_LOGIC_VECTOR (4 downto 0);
           REG_RD : in STD_LOGIC_VECTOR (4 downto 0);
           REG_S1 : out STD_LOGIC_VECTOR (31 downto 0);
           REG_S2 : out STD_LOGIC_VECTOR (31 downto 0);
           REG_Data : in STD_LOGIC_VECTOR (31 downto 0);
           reset : in std_logic;
           REG_WriteClk : in STD_LOGIC);
end RegisterFile;

architecture Behavioral of RegisterFile is
COMPONENT LATCH32
  Port (   LATCH32_IN : in STD_LOGIC_VECTOR (31 downto 0);
           LATCH32_OUT : out STD_LOGIC_VECTOR (31 downto 0);
           LATCH32_Reset : in std_logic;
           LATCH32_Clock : in STD_LOGIC
   );
END COMPONENT;

type BusArray is array (31 downto 0) of std_logic_vector(31 downto 0);
signal LatchArray : BusArray;

signal INT_LATCH32_IN : STD_LOGIC_VECTOR(31 downto 0);

signal INT_LATCH32_SEL : STD_LOGIC_VECTOR(31 downto 0);

begin
INT_LATCH32_IN <= Reg_data;

LatchArray(0) <= X"00000000";

  with REG_RS1 select
    REG_S1 <= LatchArray(1) when "00001",
          LatchArray(2) when "00010",
          LatchArray(3) when "00011",
          LatchArray(4) when "00100",
          LatchArray(5) when "00101",
          LatchArray(6) when "00110",
          LatchArray(7) when "00111",
          LatchArray(8) when "01000",
          LatchArray(9) when "01001",
          LatchArray(10) when "01010",
          LatchArray(11) when "01011",
          LatchArray(12) when "01100",
          LatchArray(13) when "01101",
          LatchArray(14) when "01110",
          LatchArray(15) when "01111",
          LatchArray(16) when "10000",
          LatchArray(17) when "10001",
          LatchArray(18) when "10010",
          LatchArray(19) when "10011",
          LatchArray(20) when "10100",
          LatchArray(21) when "10101",
          LatchArray(22) when "10110",
          LatchArray(23) when "10111",
          LatchArray(24) when "11000",
          LatchArray(25) when "11001",
          LatchArray(26) when "11010",
          LatchArray(27) when "11011",
          LatchArray(28) when "11100",
          LatchArray(29) when "11101",
          LatchArray(30) when "11110",
          LatchArray(31) WHEN "11111",
          LatchArray(0) when others;
       
   with REG_RS2 select
    REG_S2 <= LatchArray(1) when "00001",
          LatchArray(2) when "00010",
          LatchArray(3) when "00011",
          LatchArray(4) when "00100",
          LatchArray(5) when "00101",
          LatchArray(6) when "00110",
          LatchArray(7) when "00111",
          LatchArray(8) when "01000",
          LatchArray(9) when "01001",
          LatchArray(10) when "01010",
          LatchArray(11) when "01011",
          LatchArray(12) when "01100",
          LatchArray(13) when "01101",
          LatchArray(14) when "01110",
          LatchArray(15) when "01111",
          LatchArray(16) when "10000",
          LatchArray(17) when "10001",
          LatchArray(18) when "10010",
          LatchArray(19) when "10011",
          LatchArray(20) when "10100",
          LatchArray(21) when "10101",
          LatchArray(22) when "10110",
          LatchArray(23) when "10111",
          LatchArray(24) when "11000",
          LatchArray(25) when "11001",
          LatchArray(26) when "11010",
          LatchArray(27) when "11011",
          LatchArray(28) when "11100",
          LatchArray(29) when "11101",
          LatchArray(30) when "11110",
          LatchArray(31) WHEN "11111",
          LatchArray(0) when others;


    PROCESS(REG_WriteClk,REG_RD)
    begin
        if( REG_RD="00001") then
        INT_LATCH32_SEL(1) <= REG_WriteClk;
        elsif( REG_RD="00010") then
        INT_LATCH32_SEL(2) <= REG_WriteClk;
        elsif( REG_RD="00011") then
        INT_LATCH32_SEL(3) <= REG_WriteClk;
        elsif( REG_RD="00100") then
        INT_LATCH32_SEL(4) <= REG_WriteClk;
        elsif( REG_RD="00101") then
        INT_LATCH32_SEL(5) <= REG_WriteClk;
        elsif( REG_RD="00110") then
        INT_LATCH32_SEL(6) <= REG_WriteClk;
        elsif( REG_RD="00111") then
        INT_LATCH32_SEL(7) <= REG_WriteClk;
        elsif( REG_RD="01000") then
        INT_LATCH32_SEL(8) <= REG_WriteClk;
        elsif( REG_RD="01001") then
        INT_LATCH32_SEL(9) <= REG_WriteClk;
        elsif( REG_RD="01010") then
        INT_LATCH32_SEL(10) <= REG_WriteClk;
        elsif( REG_RD="01011") then
        INT_LATCH32_SEL(11) <= REG_WriteClk;
        elsif( REG_RD="01100") then
        INT_LATCH32_SEL(12) <= REG_WriteClk;
        elsif( REG_RD="01101") then
        INT_LATCH32_SEL(13) <= REG_WriteClk;
        elsif( REG_RD="01110") then
        INT_LATCH32_SEL(14) <= REG_WriteClk;
        elsif( REG_RD="01111") then
        INT_LATCH32_SEL(15) <= REG_WriteClk;
        elsif( REG_RD="10000") then
        INT_LATCH32_SEL(16) <= REG_WriteClk;
        elsif( REG_RD="10001") then
        INT_LATCH32_SEL(17) <= REG_WriteClk;
        elsif( REG_RD="10010") then
        INT_LATCH32_SEL(18) <= REG_WriteClk;
        elsif( REG_RD="10011") then
        INT_LATCH32_SEL(19) <= REG_WriteClk;
        elsif( REG_RD="10100") then
        INT_LATCH32_SEL(20) <= REG_WriteClk;
        elsif( REG_RD="10101") then
        INT_LATCH32_SEL(21) <= REG_WriteClk;
        elsif( REG_RD="10110") then
        INT_LATCH32_SEL(22) <= REG_WriteClk;
        elsif( REG_RD="10111") then
        INT_LATCH32_SEL(23) <= REG_WriteClk;
        elsif( REG_RD="11000") then
        INT_LATCH32_SEL(24) <= REG_WriteClk;
        elsif( REG_RD="11001") then
        INT_LATCH32_SEL(25) <= REG_WriteClk;
        elsif( REG_RD="11010") then
        INT_LATCH32_SEL(26) <= REG_WriteClk;
        elsif( REG_RD="11011") then
        INT_LATCH32_SEL(27) <= REG_WriteClk;
        elsif( REG_RD="11100") then
        INT_LATCH32_SEL(28) <= REG_WriteClk;
        elsif( REG_RD="11101") then
        INT_LATCH32_SEL(29) <= REG_WriteClk;
        elsif( REG_RD="11110") then
        INT_LATCH32_SEL(30) <= REG_WriteClk;
        elsif( REG_RD="11111") then
        INT_LATCH32_SEL(31) <= REG_WriteClk;
        end if;
        
    end process;
    
    Latches: for i in 1 to 31 generate
        U: LATCH32 Port Map ( LATCH32_IN => INT_LATCH32_IN,LATCH32_OUT=>LatchArray(i),Latch32_Reset=>reset,LATCH32_Clock=>INT_LATCH32_SEL(i));
    end generate;



end Behavioral;
