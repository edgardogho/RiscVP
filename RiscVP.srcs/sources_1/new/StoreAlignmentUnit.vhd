----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2021 02:50:03 PM
-- Design Name: 
-- Module Name: StoreAlignmentUnit - Behavioral
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

entity StoreAlignmentUnit is
    Port ( SA_UnalignedData : in STD_LOGIC_VECTOR (31 downto 0);
           SA_AlignedData : out STD_LOGIC_VECTOR (31 downto 0);
           SA_LNotR : in STD_LOGIC;
           SA_Shamt : in STD_LOGIC_VECTOR (1 downto 0));
end StoreAlignmentUnit;

architecture Behavioral of StoreAlignmentUnit is
COMPONENT BarrelShifterRight32 
Port (     DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           shift : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0);
           Arith : in STD_LOGIC);
end COMPONENT;
COMPONENT BarrelShifterLeft32 
    Port ( DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           shift : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

signal leftShift, rightShift : std_logic_vector(31 downto 0);

signal shiftAmt : std_logic_vector(4 downto 0);
begin

shiftAmt<=SA_Shamt(1) & SA_Shamt(0) & "000";
SA_AlignedData <= leftShift when SA_LNotR='1' else rightShift;
U0: BarrelShifterRight32 Port Map(DataIn=>SA_UnalignedData,shift=>shiftAmt,DataOut=>rightShift,Arith=>'0');
U1: BarrelShifterLeft32  Port Map(DataIn=>SA_UnalignedData, shift=>shiftAmt,DataOut=>leftShift);

end Behavioral;
