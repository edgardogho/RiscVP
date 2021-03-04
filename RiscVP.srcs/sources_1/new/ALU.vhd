----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      ALU module supports: Add, Sub, AND, OR, XOR and shifts (logical,Arith)
--      Fully combinational logic (Adder/sub uses DSP48 Adder IP)
--      Carry_IN is used to increase by 1 for UNALIGNED Access
--      CCR Indicates condition between A and B:
--          ALU_CCR(5)= Equal 
--          ALU_CCR(4)= Not Equal 
--          ALU_CCR(3)= Less Than
--          ALU_CCR(2)= Greater or Equal
--          ALU_CCR(1)= Less Than Unsigned
--          ALU_CCR(0)= Greater or Equal Unsigned
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU is
    Port ( ALU_A : in STD_LOGIC_VECTOR (31 downto 0);
           ALU_B : in STD_LOGIC_VECTOR (31 downto 0);
           ALU_CIN: IN STD_LOGIC;
           ALU_RES : out STD_LOGIC_VECTOR (31 downto 0);
           ALU_OP : in STD_LOGIC_VECTOR (3 downto 0);
           ALU_CCR: out STD_LOGIC_VECTOR(5 downto 0));
           --ALUCCR(5)= Equal 
           --ALUCCR(4)= Not Equal 
           --ALUCCR(3)= Less Than
           --ALUCCR(2)= Greater or Equal
           --ALUCCR(1)= Less Than Unsigned
           --ALUCCR(0)= Greater or Equal Unsigned
           
end ALU;

architecture Behavioral of ALU is
Component AdderSub
port( A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ADD : IN STD_LOGIC;
    C_IN : IN STD_LOGIC;
    C_OUT : OUT STD_LOGIC;
    S : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
end component;

Component BarrelShifterLeft32
port(DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           shift : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;

Component BarrelShifterRight32
port(
DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           shift : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0);
           Arith : in STD_LOGIC);
end component;

signal internal_adder: std_logic_vector(31 downto 0);
signal internal_shiftright: std_logic_vector(31 downto 0);
signal internal_shiftleft: std_logic_vector(31 downto 0);
signal internal_and: std_logic_vector(31 downto 0);
signal internal_or: std_logic_vector(31 downto 0);
signal internal_xor: std_logic_vector(31 downto 0);

signal internal_add: std_logic;
signal internal_carry: std_logic;
signal internal_neg : std_logic;
--signal internal_overflow_add : std_logic;
signal internal_overflow_sub : std_logic;
signal internal_arith: std_logic;

begin

U1: AdderSub Port Map(A=>ALU_A,B=>ALU_B,Add=>internal_add,C_IN=>ALU_CIN,C_Out=>internal_carry,S=>internal_adder);

internal_add <= Not ALU_OP(3);
internal_Arith <= ALU_OP(3);
internal_neg <= internal_adder(31);
--internal_overflow_add <= (not a(31) AND not b(31) and internal_adder(31) ) OR ( a(31) AND b(31) AND not internal_adder(31) );
internal_overflow_sub <= ( ALU_A(31) and NOT ALU_B(31) and not internal_adder(31) ) OR ( not ALU_A(31) AND ALU_B(31) and internal_Adder(31) );
--BEQ
ALU_CCR(5) <= '1' when internal_adder=X"00000000" else '0';
--BNE
ALU_CCR(4) <= '0' when internal_adder=X"00000000" else '1';

--BLT
ALU_CCR(3) <= internal_neg XOR internal_overflow_sub; 
--BGE
ALU_CCR(2) <= not (internal_neg XOR internal_overflow_sub);
--BLTU
ALU_CCR(1) <= internal_carry;
--BGEU
ALU_CCR(0) <= not internal_carry;



internal_and <= ALU_A AND ALU_B;
internal_or  <= ALU_A OR ALU_B;
internal_xor <= ALU_A XOR ALU_B;

U2: BarrelShifterRight32 Port Map( DataIn=>ALU_A,DataOut=>internal_shiftright,shift=>ALU_B(4 downto 0),Arith=>internal_arith);
U3: BarrelShifterLeft32  Port Map( DataIn=>ALU_A,DataOut=>internal_shiftleft, shift=>ALU_B(4 downto 0));

with ALU_OP select
ALU_RES <= internal_adder when "0000", --Adding
          internal_adder when "1000", --Sub
          internal_shiftright when "0101", --Shift right logical
          internal_shiftright when "1101", --Shift right arith
          internal_shiftleft  when "0001", --Shift left
          internal_and when "0111",
          internal_or  when "0110",
          internal_xor when "0100",
          ALU_B when others;


end Behavioral;
