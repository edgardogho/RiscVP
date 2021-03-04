----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      MEMIOUnit is used to keep Scratchpad RAM and I/O devices on a single
--      module that is controled by the CPU.
--      It decodes the memory map to select RAM or I/O devices
--      Has GPI port that can read 8 bits from outside world
--      Has GPO port that can write 8 bits to the outside world
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MEMIOUNIT is
    Port ( MEMIO_DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           MEMIO_DataOut : out STD_LOGIC_VECTOR (31 downto 0);
           MEMIO_Clk : in STD_LOGIC;
           MEMIO_Reset : in STD_LOGIC;
           MEMIO_Address : in STD_LOGIC_VECTOR (31 downto 0);
           MEMIO_GPI : in STD_LOGIC_VECTOR (7 downto 0);
           MEMIO_GPO : out STD_LOGIC_VECTOR (7 downto 0);
           MEMIO_Write : in STD_LOGIC_VECTOR (3 downto 0));
end MEMIOUNIT;

architecture Behavioral of MEMIOUNIT is
COMPONENT LATCH4x8
Port ( LATCH4x8_IN : in STD_LOGIC_VECTOR (31 downto 0);
           LATCH4x8_OUT : out STD_LOGIC_VECTOR (31 downto 0);
           LATCH4x8_Reset : in STD_LOGIC;
           LATCH4x8_Clock : in STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT RAM1024x32
PORT(
           Address : in STD_LOGIC_VECTOR (9 downto 0);
           DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0);
           Write : in STD_LOGIC_VECTOR(3 downto 0);
           Clk : in STD_LOGIC);
END COMPONENT;

Signal DecoderRAM, DecoderGPI,DecoderGPO : std_logic; --Decoders
Signal ClockRAM : std_logic;

Signal WriteRAM, WriteGPI, WriteGPO : std_logic_vector(3 downto 0);

--Mux for Output
Signal RAM_OUT, GPI_OUT, GPO_OUT : std_logic_vector(31 downto 0);
Signal MuxSelect : std_logic_vector(2 downto 0);

--Input devices need a new proxy signal
Signal GPI_Proxy : std_logic_vector(31 downto 0);

begin
--Logic for the decoders
DecoderRAM <= '1' when MEMIO_Address(28)='0'  else '0'; --Ram from 0x0000 0000 to 0x0FFF FFFF
DecoderGPI <= '1' when MEMIO_Address=X"10012000" else '0';  --GPI is on 0x1001 2000
DecoderGPO <= '1' when MEMIO_Address=X"10012004" else '0';   --GPO is on 0x1001 2001

--Ram is only clocked when its addressed
ClockRAM <= MEMIO_Clk AND DecoderRAM;

--Logic for Writes which transform this on ChipSelect
WriteRAM(0)<=MEMIO_Write(0) AND DecoderRAM;
WriteRAM(1)<=MEMIO_Write(1) AND DecoderRAM;
WriteRAM(2)<=MEMIO_Write(2) AND DecoderRAM;
WriteRAM(3)<=MEMIO_Write(3) AND DecoderRAM;

WriteGPI(0)<=MEMIO_Write(0) AND DecoderGPI;
WriteGPI(1)<=MEMIO_Write(1) AND DecoderGPI;
WriteGPI(2)<=MEMIO_Write(2) AND DecoderGPI;
WriteGPI(3)<=MEMIO_Write(3) AND DecoderGPI;

WriteGPO(0)<=MEMIO_Write(0) AND DecoderGPO;
WriteGPO(1)<=MEMIO_Write(1) AND DecoderGPO;
WriteGPO(2)<=MEMIO_Write(2) AND DecoderGPO;
WriteGPO(3)<=MEMIO_Write(3) AND DecoderGPO;

--Logic for Out Mux
MuxSelect(2)<=DecoderRAM;
MuxSelect(1)<=DecoderGPI;
MuxSelect(0)<=DecoderGPO;
MEMIO_DataOut <= RAM_OUT when MuxSelect(2)='1' else
                 GPI_OUT when MuxSelect(1)='1' else
                 GPO_OUT when MuxSelect(0)='1' else
                 X"00000000";
                 
--Finally map the components
U0:RAM1024x32 Port Map(
    Address=> MEMIO_Address(11 downto 2),
    DataIn=> MEMIO_DataIn,
    DataOut=> RAM_OUT,
    Write=> WriteRAM ,
    Clk=> ClockRam
);

GPI_Proxy <= MEMIO_DataIn(31 downto 8) & MEMIO_GPI;
--Map GPI
U1:LATCH4x8 Port Map(
           LATCH4x8_IN => GPI_Proxy,
           LATCH4x8_OUT => GPI_OUT,
           LATCH4x8_Reset => MEMIO_Reset,
           LATCH4x8_Clock => WriteGPI
);

MEMIO_GPO <= GPO_OUT(7 downto 0);
--Map GPO
U2:LATCH4x8 Port Map(
           LATCH4x8_IN => MEMIO_DataIn,
           LATCH4x8_OUT => GPO_OUT,
           LATCH4x8_Reset => MEMIO_Reset,
           LATCH4x8_Clock => WriteGPO
);


end Behavioral;
