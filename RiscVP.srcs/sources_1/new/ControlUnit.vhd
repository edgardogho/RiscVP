----------------------------------------------------------------------------------
-- Author: Edgardo Gho (edgardogho@me.com)
-- ProjectName: RISC-Vp
-- Company: UNLaM
-- Target Device: XC7A35 (Xilinx Artix-7)
-- Tool Version: Vivado 2019.2

-- Description: 
--      Control Unit for RISC-Vp CPU. 
--      Basically a State Machine that Fetches, Decodes, Executes Instructions
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ControlUnit is
    Port ( Instruction : in STD_LOGIC_VECTOR (31 downto 0);
           Reset : in std_logic;
           MasterClock : in std_logic;
           ALU_CCR: in STD_LOGIC_VECTOR(5 downto 0);
           ALU_RES: in STD_LOGIC_VECTOR(1 downto 0);
           ALU_AMuxSel : out std_logic;
           ALU_BMuxSel : out std_logic;
           ALU_OP: out STD_LOGIC_VECTOR (3 downto 0);
           ALU_ADD4MuxSel : out STD_LOGIC; 
           INST_Clk : out std_logic;
           PC_JumpMuxSel : out STD_LOGIC;
           PC_JARLMuxSel : out STD_LOGIC;
           PC_Clk : out STD_LOGIC;
           REG_WriteMuxSel : out STD_LOGIC_VECTOR(1 downto 0);
           REG_WriteClk: out std_logic;
           MEMIO_Clk : out std_logic;
           MEMIO_Write :out std_logic_vector(3 downto 0);
           LA_LatchWrite : out std_logic_Vector(3 downto 0);
           LA_LatchMuxSel : out std_logic;
           LA_SizeAdj : out std_logic_vector(2 downto 0);
           SALA_LNotR: out std_logic;
           SALA_Shamt : out std_logic_vector(1 downto 0)
           );
end ControlUnit;

architecture Behavioral of ControlUnit is
TYPE STATE_TYPE IS (Hold, --When CU Reset=1
                    Fetch, --Look for Instruction pulsing INST_Clk
                    Decode, --Decode Instruction
                    LUI, --Load UpperImmediate decoded
                    AUIPC, --Add Upper Immediate to PC decoded
                    JAL , --Jump and Link
                    JALR, --Jump and Link Register
                    BEQ, --Branch if Equal
                    BNE, --Branch if not equal
                    BLT, --Branch less than
                    BGE, --Branch greater equal
                    BLTU,--BRanch less than Unsigned
                    BGEU,--Branch greater equal unsigned
                    LWAlignCheck,
                    LWALignFix,
                    LWAlignPenalty,
                    LWAlignFinish,
                    LBAlignCheck,
                    LBUAlignCheck,
                    LHAlignCheck,
                    LHAlignFix,
                    LHAlignPenalty,
                    LHAlignFinish,
                    LHUAlignCheck,
                    LHUAlignFix,
                    LHUAlignPenalty,
                    LHUAlignFinish,
                    SWAlignCheck,
                    SWAlignFix,
                    SWAlignPenalty,
                    SWAlignFinish,
                    SBAlignCheck,
                    SHAlignCheck,
                    SHAlignFix,
                    SHAlignPenalty,
                    SHALignFinish,
                    ADDI, --Add Immediate decoded
                    SLTI, --Set Less Than Immediante decoded
                    SLTIU, --Set less than Immediate unsigned decoded
                    XORI, --Xor Immediate decoded
                    ORI, --Or Immediate decoded
                    ANDI, --And Immediate decoded
                    SLLI, --Shift Left Logical immediate decoded
                    SRLI, --Shift right logical immediate decoded
                    SRAI, --Shift right Arith immediate decoded
                    ADD , --Add decoded
                    SUB , --Sub decoded
                    SL_L , --Shift left logical
                    SLT , --Set less than
                    SLTU, --set less than unsigned
                    XO_R, --Xor
                    SR_L, --Shift right logical
                    SR_A, --Shift right Arith
                    O_R, --OR
                    AN_D, --AND
                    WriteBack, --Effectively Write to register something
                    SaveRam, --Don't update reg but clock the ram
                    NopWriteBack); --Leave without updating Registers
SIGNAL currentState,nextState   : STATE_TYPE;

SIGNAL OPCODEFUNCT : STD_LOGIC_VECTOR (16 downto 0); --This is combined funct7&funct3&opcode

begin   

OPCODEFUNCT <= Instruction(31 downto 25) & Instruction(14 downto 12) & Instruction(6 downto 0);


--Write the sequential process that keeps the State register updated
SeqStateProc: process (Reset,MasterClock)
begin
    if (Reset='0') then
        currentState<= Hold; --While Reset=0 stay in hold
    elsif (MasterClock'EVENT and MasterClock='1') then --Rising edge on clock
        currentState<= nextState;
    end if;
end process;

--Write combinational process to calculate next state and move outputs (Outputs should be latched)
CombStateProc: process(currentState,Instruction,OPCODEFUNCT,ALU_CCR,ALU_RES)
begin
    case currentState is
    when Hold => --While its reset set signal levels
        nextState<= Fetch; --Move to Fetch when out of reset
        --Set all the outputs to known values
         ALU_AMuxSel <='0';
         ALU_BMuxSel <='0';
         ALU_OP <="0000";
         ALU_ADD4MuxSel <='0';
         INST_Clk <='0';
         PC_JumpMuxSel <='0';
         PC_JARLMuxSel <='0';
         PC_Clk <='0';
         REG_WriteMuxSel <="00";
         REG_WriteClk <='0';
         MEMIO_Clk <='0';
         MEMIO_Write <="0000";
         LA_LatchWrite <="0000";
         LA_LatchMuxSel <='0';
         LA_SizeAdj <="000";
         SALA_LNotR <='0';
         SALA_Shamt <="00";
         
    when Fetch => --Should clock the Instruction Memory and get the instruction
    nextState<= Decode; --Move to Decode after fetching
        --Set all the outputs to known values
        ALU_AMuxSel <='0';
         ALU_BMuxSel <='0';
         ALU_OP <="0000";
         ALU_ADD4MuxSel <='0';
         INST_Clk <='1';
         PC_JumpMuxSel <='0';
         PC_JARLMuxSel <='0';
         PC_Clk <='0';
         REG_WriteMuxSel <="00";
         REG_WriteClk <='0';
         MEMIO_Clk <='0';
         MEMIO_Write <="0000";
         LA_LatchWrite <="0000";
         LA_LatchMuxSel <='0';
         LA_SizeAdj <="000";
         SALA_LNotR <='0';
         SALA_Shamt <="00";
    when Decode => --Should figure out next state based on OPCODEFUNCT
         INST_Clk <='0';
         if OPCODEFUNCT(6 downto 0)="0110111" then-- LUI 
            nextState <= LUI;
            ALU_BMuxSel <='1'; --Load upper immediate requires immediate on ALU
            ALU_OP <="1111"; --Transparent ALU copy B (immediate)
         elsif OPCODEFUNCT(6 downto 0)="0010111" then-- AUIPC 
            nextState <= AUIPC;
            ALU_AMUXSel <= '1'; --ALu A uses PC as input (Add upper immediate to PC)
            ALU_BMuxSel <= '1'; --Alu B has the immediate part that gets added to PC
            --ALU op is Add since it should be on "0000" already skip
         elsif OPCODEFUNCT(6 downto 0)="1101111" then-- JAL 
            nextState <= JAL;
            PC_JumpMUXSel<='1'; --Jump and Link will always jump, so set the JumpMuxSel so IMM adds to PC
            REG_WriteMuxSel <= "10"; --Save PC+4 (next instruction address) on RD
            --No need for ALU OPs in here, ALU is not used
         elsif OPCODEFUNCT(9 downto 0)="000"&"1100111" then-- JALR 
            nextState <= JALR;
            PC_JARLMUXSel <= '1'; --PC is set from ALU result
            REG_WriteMuxSel <= "10"; --Save PC+4 on RD (Return Address)
            ALU_BMuxSel <= '1'; --Immediate gets added to R1 and goes to PC
            --ALU op is Add so skip since "0000" is default add
         elsif OPCODEFUNCT(9 downto 0)="000"&"1100011" then --BEQ
            nextState <= BEQ;
            ALU_OP <="1000"; --Need to subtract to update ALU CCR
         elsif OPCODEFUNCT(9 downto 0)="001"&"1100011" then --BNE
            nextState <= BNE;
            ALU_OP <="1000"; --Need to subtract to update ALU CCR
         elsif OPCODEFUNCT(9 downto 0)="100"&"1100011" then --BLT
            nextState <= BLT;
            ALU_OP <="1000"; --Need to subtract to update ALU CCR
         elsif OPCODEFUNCT(9 downto 0)="101"&"1100011" then --BGE
            nextState <= BGE;
            ALU_OP <="1000"; --Need to subtract to update ALU CCR
         elsif OPCODEFUNCT(9 downto 0)="110"&"1100011" then --BLTU
            nextState <= BLTU;
            ALU_OP <="1000"; --Need to subtract to update ALU CCR
         elsif OPCODEFUNCT(9 downto 0)="111"&"1100011" then --BGEU
            nextState <= BGEU;
            ALU_OP <="1000"; --Need to subtract to update ALU CCR
         elsif OPCODEFUNCT(9 downto 0)="010"&"0000011" then --LW
            nextState<= LWAlignCheck; --Check Alignment after calculating MEMIO Address
            REG_WriteMuxSel <= "01"; --Will load value from RAM on RD
            ALU_BMuxSel <= '1';--Calculate (R1) Address+Offset adding with immediate
            --Alu OP is add so default "0000"
         elsif OPCODEFUNCT(9 downto 0)="000"&"0000011" then --LB
            nextState<= LBAlignCheck; --Check Alignment after calculating MEMIO Address
            REG_WriteMuxSel <= "01"; --Will load value from RAM on RD
            ALU_BMuxSel <= '1';--Calculate (R1) Address+Offset adding with immediate
            --Alu OP is add so default "0000"
         elsif OPCODEFUNCT(9 downto 0)="100"&"0000011" then --LBU
            nextState<= LBUAlignCheck; --Check Alignment after calculating MEMIO Address
            REG_WriteMuxSel <= "01"; --Will load value from RAM on RD
            ALU_BMuxSel <= '1';--Calculate (R1) Address+Offset adding with immediate
            --Alu OP is add so default "0000"
         elsif OPCODEFUNCT(9 downto 0)="001"&"0000011" then --LH
            nextState<= LHAlignCheck; --Check Alignment after calculating MEMIO Address
            REG_WriteMuxSel <= "01"; --Will load value from RAM on RD
            ALU_BMuxSel <= '1';--Calculate (R1) Address+Offset adding with immediate
            --Alu OP is add so default "0000"
         elsif OPCODEFUNCT(9 downto 0)="101"&"0000011" then --LHU
            nextState<= LHUAlignCheck; --Check Alignment after calculating MEMIO Address
            REG_WriteMuxSel <= "01"; --Will load value from RAM on RD
            ALU_BMuxSel <= '1';--Calculate (R1) Address+Offset adding with immediate
            --Alu OP is add so default "0000"
         elsif OPCODEFUNCT(9 downto 0)="010"&"0100011" then --SW
            nextState<= SWAlignCheck; --Check Alignment after calculating MEMIO Address
            MEMIO_Write    <= "1111"; --Lets hope its aligned and we can write all bytes at once
            ALU_BMuxSel <= '1';--Calculate (R1) Address+Offset adding with immediate
         elsif OPCODEFUNCT(9 downto 0)="000"&"0100011" then --SB
            nextState<= SBAlignCheck; --Check Alignment after calculating MEMIO Address
            MEMIO_Write    <= "0001"; --Lets hope its aligned and we can write all bytes at once
            ALU_BMuxSel <= '1';--Calculate (R1) Address+Offset adding with immediate
         elsif OPCODEFUNCT(9 downto 0)="001"&"0100011" then --SH
            nextState<= SHAlignCheck; --Check Alignment after calculating MEMIO Address
            MEMIO_Write    <= "0011"; --Lets hope its aligned and we can write all bytes at once
            ALU_BMuxSel <= '1';--Calculate (R1) Address+Offset adding with immediate
         elsif OPCODEFUNCT(9 downto 0)="000"&"0010011" then --ADDI
            nextState <= ADDI;
            ALU_BMuxSel <= '1'; --Immediate operation requires immediate on B
            --ALU op is add so default "0000" will add
         elsif OPCODEFUNCT(9 downto 0)="010"&"0010011" then --SLTI
            nextState <= SLTI;
            REG_WriteMuxSel <= "11"; --Grab value from Set Unit and store on RD
            ALU_BMuxSel <= '1'; --Immediate operation requires immediate on B
            ALU_OP <="1000"; --Subtract OP
         elsif OPCODEFUNCT(9 downto 0)="011"&"0010011" then --SLTIU
            nextState <= SLTIU;
            REG_WriteMuxSel <= "11"; --Grab value from Set Unit and store on RD
            ALU_BMuxSel <= '1'; --Immediate operation requires immediate on B
            ALU_OP <="1000"; --Subtract OP
         elsif OPCODEFUNCT(9 downto 0)="100"&"0010011" then --XORI
            nextState <= XORI;
            ALU_BMuxSel <= '1'; --Immediate operation requires immediate on B
            ALU_OP <="0100"; --Xor op in ALU
         elsif OPCODEFUNCT(9 downto 0)="110"&"0010011" then --ORI
            nextState <= ORI;
            ALU_BMuxSel <= '1'; --Immediate operation requires immediate on B
            ALU_OP <="0110"; --or op in ALU
         elsif OPCODEFUNCT(9 downto 0)="111"&"0010011" then --ANDI
            nextState <= ANDI;
            ALU_BMuxSel <= '1'; --Immediate operation requires immediate on B
            ALU_OP <="0111"; --and op in ALU
         elsif OPCODEFUNCT     ="0000000"&"001"&"0010011" then --SLLI
            nextState <= SLLI;
            ALU_BMuxSel <= '1'; --Immediate operation requires immediate on B
            ALU_OP <="0001"; --sll op in ALU
         elsif OPCODEFUNCT     ="0000000"&"101"&"0010011" then --SRLI
            nextState <= SRLI;
            ALU_BMuxSel <= '1'; --Immediate operation requires immediate on B
            ALU_OP <="0101"; --srl op in ALU
         elsif OPCODEFUNCT     ="0100000"&"101"&"0010011" then --SRAI
            nextState <= SRAI;
            ALU_BMuxSel <= '1'; --Immediate operation requires immediate on B
            ALU_OP <="1101"; --sra op in ALU
         elsif OPCODEFUNCT     ="0000000"&"000"&"0110011" then --ADD
            nextState <= ADD;
            --ALU OP is 0000 add which is default
         elsif OPCODEFUNCT     ="0100000"&"000"&"0110011" then --SUB
            nextState <= SUB;
            ALU_OP <="1000"; --SUB op on ALU
         elsif OPCODEFUNCT     ="0000000"&"001"&"0110011" then --SL_L
            nextState <= SL_L;
            ALU_OP <="0001"; --SLL op on ALU
         elsif OPCODEFUNCT     ="0000000"&"010"&"0110011" then --SLT
            nextState <= SLT;
            REG_WriteMuxSel <= "11"; --Grab value from set unit and put on RD
            ALU_OP <="1000"; --SUB op in ALU
         elsif OPCODEFUNCT     ="0000000"&"011"&"0110011" then --SLTU
            nextState <= SLTU;
            REG_WriteMuxSel <= "11"; --Grab value from set unit and put on RD
            ALU_OP <="1000"; --SUB op in ALU
         elsif OPCODEFUNCT     ="0000000"&"100"&"0110011" then --XO_R
            nextState <= XO_R;
            ALU_OP <="0100"; -- XOR op in ALU
         elsif OPCODEFUNCT     ="0000000"&"101"&"0110011" then --SR_L
            nextState <= SR_L;
            ALU_OP <="0101"; --SRL op in ALU
         elsif OPCODEFUNCT     ="0100000"&"101"&"0110011" then --SR_A
            nextState <= SR_A;
            ALU_OP <="1101"; --SRA op in ALU
         elsif OPCODEFUNCT     ="0000000"&"110"&"0110011" then --O_R
            nextState <= O_R;
            ALU_OP <="0110"; --OR op in ALU
         elsif OPCODEFUNCT     ="0000000"&"111"&"0110011" then --AN_D
            nextState <= AN_D;
            ALU_OP <="0111"; --AND op in ALU
         else
            nextState <=NopWriteBack; --Means invalid/not supported instruction
         end if;
    when LUI => --Decoded LUI so handle it
         nextState<= WriteBack; --No memory access on this instruction but requires WB.      
    when AUIPC => --Decoded AUIPC so handle it
         nextState<= WriteBack; --No memory access but needs to WB the PC+IMM on RD
    when JAL => --Decoded JAL
         nextState<= WriteBack; --No memory access but will WB the PC+4
    when JALR => --Decoded JALR
         nextState<= WriteBack; --No memory access but will WB the PC+4     
    when BEQ => --Decoded BEQ
         nextState<= NopWriteBack; --No memory access but need to define branch result
         if (ALU_CCR(5)='1') then
            PC_JumpMuxSel<='1';
         else
            PC_JumpMuxSel<='0';
         end if;
    when BNE => --Decoded BNE
        nextState<= NopWriteBack; --No memory access but need to define branch result
         if (ALU_CCR(4)='1') then
            PC_JumpMuxSel<='1';
         else
            PC_JumpMuxSel<='0';
         end if;    
    when BLT => --Decoded BLT
         nextState<= NopWriteBack; --No memory access but need to define branch result
         if (ALU_CCR(3)='1') then
            PC_JumpMuxSel<='1';
         else
            PC_JumpMuxSel<='0';
         end if;
    when BGE => --Decoded BGE
         nextState<= NopWriteBack; --No memory access but need to define branch result
         if (ALU_CCR(2)='1') then
            PC_JumpMuxSel<='1';
         else
            PC_JumpMuxSel<='0';
         end if;    
    when BLTU => --Decoded BLTU
         nextState<= NopWriteBack; --No memory access but need to define branch result
         if (ALU_CCR(1)='1') then
            PC_JumpMuxSel<='1';
         else
            PC_JumpMuxSel<='0';
         end if;
    when BGEU => --Decoded BGEU
         nextState<= NopWriteBack; --No memory access but need to define branch result
         if (ALU_CCR(0)='1') then
            PC_JumpMuxSel<='1';
         else
            PC_JumpMuxSel<='0';
         end if;

         
    --All states are different but do the same.. its basically a wait state so all 
    --instructions consume the same number of clocks.. using a different state
    --instead of a single wait state so we can clearly see which instruction is being
    --executed on the simulator.
    when ADDI => --Decoded ADDI 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when SLTI => --Decoded SLTI
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when SLTIU => --Decoded SLTIU , which is identical to SLTI since Jump unit uses lt OR ltu from Instruction(12)
         nextState<= WriteBack; --Next state is Nop on Mem but jump to effective Write back afterwards
    when XORI => --Decoded Xori
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when ORI => --Decoded ori
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when ANDI => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when SLLI => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when SRLI => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when SRAI => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when ADD => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when SUB => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when SL_L => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when SLT => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when SLTU => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when XO_R => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when SR_L => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when SR_A => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when O_R => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when AN_D => 
         nextState<= WriteBack; --No memory access but need to WB result on RD
    when LBAlignCheck =>
         --Fix LB Aligned as needed
         MEMIO_Clk <= '1'; --Clock to read from RAM
         if ALU_RES="01" then
            --Shift right by 8
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="01"; -- by 8
            LA_SizeAdj <="001";
            nextState<=WriteBack;
         elsif ALU_RES="10" then
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="10"; -- by 16
            LA_SizeAdj <="001";
            nextState<=WriteBack;
         elsif ALU_RES="11" then
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="11"; -- by 24
            LA_SizeAdj <="001";
            nextState<=WriteBack;
         else --Its aligned so cool
            SALA_LNotR<='0'; --Right
            LA_SizeAdj <="001";
            nextState<=WriteBack;
         end if;
    when LBUAlignCheck =>
         --Fix LBU Aligned as needed
         MEMIO_Clk <= '1'; --Clock to read from RAM
         if ALU_RES="01" then
            --Shift right by 8 
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="01"; -- by 8
            LA_SizeAdj <="101";
            nextState<=WriteBack;
         elsif ALU_RES="10" then
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="10"; -- by 16
            LA_SizeAdj <="101";
            nextState<=WriteBack;
         elsif ALU_RES="11" then
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="11"; -- by 24
            LA_SizeAdj <="101";
            nextState<=WriteBack;
         else --Its aligned so cool
            SALA_LNotR<='0'; --Right
            LA_SizeAdj <="101";
            nextState<=WriteBack; --Data is aligned so simply WriteBack
         end if;
     when LHAlignCheck =>
         --Fix LH aligment
         MEMIO_Clk <= '1'; --Clock to read from RAM
         if ALU_RES="01" then
            --Shift right by 8 save get rightmost 2 bytes
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="01"; -- by 8
            LA_SizeAdj <="010";
            nextState<=WriteBack;
         elsif ALU_RES="10" then
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="10"; -- by 16
            LA_SizeAdj <="010";
            nextState<=WriteBack;
         elsif ALU_RES="11" then --Only 1 byte is read, need to fix align
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="11"; -- by 24
            LA_SizeAdj <="010";
            nextState<=LHAlignFix;
         else --Its aligned so cool
            SALA_LNotR<='0'; --Right
            LA_SizeAdj <="010";
            nextState<=WriteBack; --Data is aligned so simply WriteBack
         end if;
     when LHAlignFix =>
         --This state the data was shifted so need to store in temp latch
         MEMIO_Clk <= '0'; --Clock to read from RAM
         SALA_LNotR<='0'; --Right
         SALA_Shamt<="11"; -- by 24
         LA_LatchWrite <= "0001"; --Save last  byte
         LA_LatchMuxSel <= '1';
         LA_SizeAdj <="010";
         ALU_ADD4MuxSel<='1'; --Add 4 to ALU RES so point to next byte
         nextState<=LHAlignPenalty;
    when LHAlignPenalty =>
         --Address is now +4 from original, need to Clock MEMIO to get new word
         MEMIO_Clk <= '1'; --Clock to read from RAM
         SALA_LNotR<='1'; --left
         SALA_Shamt<="01"; -- by 8
         LA_LatchWrite <= "0000"; --Reset latch write for next write
--         LA_LatchMuxSel <= '1';
--         LA_SizeAdj <="010";
--         ALU_ADD4MuxSel<='1';
         nextState<=LHAlignFinish;
    when LHAlignFinish =>
         --Now the second byte is there to be saved on latch
         MEMIO_Clk <= '0'; --Clock to read from RAM
         SALA_LNotR<='1'; --left
         SALA_Shamt<="01"; -- by 8
         LA_LatchWrite <= "0010"; --Save second  byte
--         LA_LatchMuxSel <= '1';
--         LA_SizeAdj <="010";
--         ALU_ADD4MuxSel<='1';
         nextState<=WriteBack; --Now finish with the write back
   when LHUAlignCheck =>
         --Fix LHU Alignment
         MEMIO_Clk <= '1'; --Clock to read from RAM
         if ALU_RES="01" then
            --Shift right by 8 and save last 2 bytes
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="01"; -- by 8
            LA_SizeAdj <="110";
            nextState<=WriteBack;
         elsif ALU_RES="10" then
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="10"; -- by 16
            LA_SizeAdj <="110";
            nextState<=WriteBack;
         elsif ALU_RES="11" then --Data penalty since its unaligned
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="11"; -- by 24
            LA_SizeAdj <="110";
            nextState<=LHUAlignFix;
         else --Its aligned so cool
            LA_SizeAdj <="110";
            nextState<=WriteBack; --Data is aligned so simply WriteBack
         end if;
     when LHUAlignFix =>
         --Data needs to be aligned, so cache the lower byte first
         MEMIO_Clk <= '0'; --Clock to read from RAM
         SALA_LNotR<='0'; --Right
         SALA_Shamt<="11"; -- by 24
         LA_LatchWrite <= "0001"; --Save last  byte
         LA_LatchMuxSel <= '1';
         LA_SizeAdj <="110";
         ALU_ADD4MuxSel<='1';
         nextState<=LHUAlignPenalty;
    when LHUAlignPenalty =>
         --This state the data was shifted so need to store in latch
         MEMIO_Clk <= '1'; --Clock to read from RAM
         SALA_LNotR<='1'; --left
         SALA_Shamt<="01"; -- by 24
         LA_LatchWrite <= "0000"; --Save last  byte
--         LA_LatchMuxSel <= '1';
--         LA_SizeAdj <="110";
--         ALU_ADD4MuxSel<='1';
         nextState<=LHUAlignFinish;
    when LHUAlignFinish =>
         --This state the data was shifted so need to store in latch
         MEMIO_Clk <= '0'; --Clock to read from RAM
         SALA_LNotR<='1'; --Right
         SALA_Shamt<="01"; -- by 24
         LA_LatchWrite <= "0010"; --Save second  byte
--         LA_LatchMuxSel <= '1';
--         LA_SizeAdj <="110";
--         ALU_ADD4MuxSel<='1';
         nextState<=WriteBack;            
    when LWAlignCheck =>
         --Check if LW is aligned
         MEMIO_Clk <= '1'; --Clock to read from RAM
         if ALU_RES="01" then
            --Shift right by 8 and save last 3 bytes
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="01"; -- by 8
            nextState<=LWAlignFix;
         elsif ALU_RES="10" then
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="10"; -- by 16
            nextState<=LWAlignFix;
         elsif ALU_RES="11" then
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="11"; -- by 24
            nextState<=LWAlignFix;
         else --Its aligned so cool
            nextState<=WriteBack; --Data is aligned so simply WriteBack
         end if;
    when LWAlignFix =>
         --This state the data was shifted so need to store in latch
         MEMIO_Clk <= '0'; --Clock to read from RAM
         if ALU_RES="01" then
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="01"; -- by 8
            LA_LatchWrite <= "0111"; --Save last 3 bytes
            LA_LatchMuxSel <= '1';
            LA_SizeAdj <="000";
            ALU_ADD4MuxSel<='1';
            nextState<=LwAlignPenalty;
         elsif ALU_RES="10" then
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="10"; -- by 8
            LA_LatchWrite <= "0011"; --Save last 2 bytes
            LA_LatchMuxSel <= '1';
            LA_SizeAdj <="000";
            ALU_ADD4MuxSel<='1';
            nextState<=LwAlignPenalty;
         else --if ALU_RES="11" then
            SALA_LNotR<='0'; --Right
            SALA_Shamt<="11"; -- by 8
            LA_LatchWrite <= "0001"; --Save last  byte
            LA_LatchMuxSel <= '1';
            LA_SizeAdj <="000";
            ALU_ADD4MuxSel<='1';
            nextState<=LwAlignPenalty;
         end if;
    when LWAlignPenalty=>
          --Need to clock again and prepare for second read
         MEMIO_Clk <= '1'; --Clock to read from RAM
         if ALU_RES="01" then
            SALA_LNotR<='1'; --Left
            SALA_Shamt<="11"; -- by 24
            LA_LatchWrite <= "0000"; --No data to save yet
            LA_LatchMuxSel <= '1';
            LA_SizeAdj <="000";
            ALU_ADD4MuxSel<='1';
            nextState<=LWAlignFinish;
         elsif ALU_RES="10" then
            SALA_LNotR<='1'; --Left
            SALA_Shamt<="10"; -- by 16
            LA_LatchWrite <= "0000"; --No data to save yet
            LA_LatchMuxSel <= '1';
            LA_SizeAdj <="000";
            ALU_ADD4MuxSel<='1';
            nextState<=LWAlignFinish;
         else --if ALU_RES="11" then
            SALA_LNotR<='1'; --Right
            SALA_Shamt<="01"; -- by 8
            LA_LatchWrite <= "0000"; --No Data to save yet
            LA_LatchMuxSel <= '1';
            LA_SizeAdj <="000";
            ALU_ADD4MuxSel<='1';
            nextState<=LWAlignFinish;
         end if;
    when LWAlignFinish=>
            --This state simply SAves the latch
          MEMIO_Clk <= '0'; --Clock to read from RAM
         if ALU_RES="01" then
            SALA_LNotR<='1'; --Left
            SALA_Shamt<="11"; -- by 24
            LA_LatchWrite <= "1000"; --Save Top Byte
            LA_LatchMuxSel <= '1';
            LA_SizeAdj <="000";
            ALU_ADD4MuxSel<='1';
            nextState<=WriteBack;
         elsif ALU_RES="10" then
            SALA_LNotR<='1'; --Left
            SALA_Shamt<="10"; -- by 16
            LA_LatchWrite <= "1100"; --Save first 2 bytes
            LA_LatchMuxSel <= '1';
            LA_SizeAdj <="000";
            ALU_ADD4MuxSel<='1';
            nextState<=WriteBack;
         else --if ALU_RES="11" then
            SALA_LNotR<='1'; --Right
            SALA_Shamt<="01"; -- by 8
            LA_LatchWrite <= "1110"; --Save first 3 bytes
            LA_LatchMuxSel <= '1';
            LA_SizeAdj <="000";
            ALU_ADD4MuxSel<='1';
            nextState<=WriteBack;
         end if;
    when SBAlignCheck => --Check if Address is aligned
        
         if ALU_RES="01" then
            --Its misaligned by 1 byte, need to shift left
            SALA_Shamt<="01";
            SALA_LNotR<='1';
            MEMIO_Write<="0010"; --Will write 3 left bytes
            nextState <= SaveRam;
         elsif ALU_RES="10" then
            --Its misaligned by 2 byte, need to shift 2 bytes left
            SALA_Shamt<="10";
            SALA_LNotR<='1';
            MEMIO_Write<="0100"; --Will write 2 left bytes
            nextState <= SaveRam;
         elsif ALU_RES="11" then
         --Its misaligned by 1 byte, need to shift 3 bytes left
            SALA_Shamt<="11";
            SALA_LNotR<='1';
            MEMIO_Write<="1000"; --Will write 1 left bytes
            nextState <= SaveRam;
         else --Aligned access
            --Its already prepared, so we can clock the MEMIO
            MEMIO_Clk <='1';
            SALA_Shamt<="00";
            SALA_LNotR<='1';
            MEMIO_Write<="0001"; --This should already be set
            nextState<= NopWriteBack;
         end if;
    when SHAlignCheck => --Check if Address is aligned
         if ALU_RES="01" then
            --Its misaligned by 1 byte, need to shift left
            SALA_Shamt<="01";
            SALA_LNotR<='1';
            MEMIO_Write<="0110"; --Will write middle bytes
            nextState <= SaveRam;
         elsif ALU_RES="10" then
            --Its misaligned by 2 byte, need to shift 2 bytes left
            SALA_Shamt<="10";
            SALA_LNotR<='1';
            MEMIO_Write<="1100"; --Will write 2 left bytes
            nextState <= SaveRam;
         elsif ALU_RES="11" then
         --Its misaligned by 1 byte, need to shift 3 bytes left
            SALA_Shamt<="11";
            SALA_LNotR<='1';
            MEMIO_Write<="1000"; --Will write 1 left bytes
            nextState <= SHAlignFix;
         else --Aligned access
            --Since its assume this was the state.. go ahead and write
             MEMIO_Clk <='1';
             MEMIO_Write<="0011"; --this should already by set
            nextState<=NopWriteBack;
         end if;
    when SHAlignFix=> --Now can save upper byte
    --Here the Store Align unit can clock the RAM to save
         MEMIO_Clk <='1'; 
         nextState<=SHAlignPenalty;
    when SHAlignPenalty=>
    --Now move to next Address
         ALU_ADD4MuxSel <='1'; --Increases Address by 4
         nextState<=SHAlignFinish;
    when SHAlignFinish=>
         MEMIO_Clk <='0'; --Down clock
         ALU_ADD4MuxSel <='1'; --Still increase Address by 4
         --Need to save lower byte, so shift right by 3 bytes
         SALA_Shamt<="01";
         SALA_LNotR<='0'; --Right!
         MEMIO_Write<="0001"; --Save last byte
         nextState<=SaveRam;
    when SWAlignCheck => --Check if Address is aligned
         if ALU_RES="01" then
            --Its misaligned by 1 byte, need to shift left
            SALA_Shamt<="01";
            SALA_LNotR<='1';
            MEMIO_Write<="1110"; --Will write 3 left bytes
            nextState <= SWAlignFix;
         elsif ALU_RES="10" then
            --Its misaligned by 2 byte, need to shift 2 bytes left
            SALA_Shamt<="10";
            SALA_LNotR<='1';
            MEMIO_Write<="1100"; --Will write 2 left bytes
            nextState <= SWAlignFix;
         elsif ALU_RES="11" then
         --Its misaligned by 1 byte, need to shift 3 bytes left
            SALA_Shamt<="11";
            SALA_LNotR<='1';
            MEMIO_Write<="1000"; --Will write 1 left bytes
            nextState <= SWAlignFix;
         else --Aligned access
            --This is expected, so we can clock MEMIO
            MEMIO_Clk <='1';
            MEMIO_Write<="1111"; --This should already be set
            nextState<=NopWriteBack;
         end if;
    when SWAlignFix=>
         --Here the Store Align unit can clock the RAM to save
         MEMIO_Clk <='1'; 
         nextState<=SWAlignPenalty;
    when SWAlignPenalty=>
         --Now move to next Address
         ALU_ADD4MuxSel <='1'; --Increases Address by 4
         nextState<=SWAlignFinish;
    when SwAlignFinish=>
         MEMIO_Clk <='0'; --Down clock
         ALU_ADD4MuxSel <='1'; --Still increase Address by 4
         if ALU_RES="01" then
            --Need to save lower byte, so shift right by 3 bytes
            SALA_Shamt<="11";
            SALA_LNotR<='0'; --Right!
            MEMIO_Write<="0001"; --Save last byte
            nextState<=SaveRam;
         elsif ALU_RES="10" then
            --Need to save 2 bytes on the right
            SALA_Shamt<="10";
            SALA_LNotR<='0'; --Right!
            MEMIO_Write<="0011"; --Save rightmost 2 bytes
            nextState<=SaveRam;
         else --if ALU_RES="11" then
            SALA_Shamt<="01";
            SALA_LNotR<='0'; --Right!
            MEMIO_Write<="0111";
            nextState<=SaveRam;
         end if;
    when WriteBack => -- Do the Write Back to register
         nextState<= Fetch;
         PC_Clk <= '1'; --Make PC capture new value
         REG_WriteClk<='1'; --Do the actual write back        
    when SaveRam =>
         --This is the 4th cycle, TECHNICALLY it could clock PC and MEMIO so that 
         -- on 4 cycles we solve the instruction.. the problem with that appears
         -- if we implement pipeline, since on the 4th cycle we should be doing
         -- Write back, and we are doing RAM.. so Save RAM will just clock MEMIO
         -- and go to NopWriteBack for next state. This means that any State
         -- that ends up here (SH, SB unaligned) will have to pay a penalty 
         -- which is avoidable in terms of cycles but not if we implement pipelining.
         nextState<= NopWriteBack;
         MEMIO_Clk<='1';
    when NopWriteBack => --Clock the PC but don't do write back
         nextState <= Fetch;
         PC_Clk <= '1'; 
    end case;
    

end process;
    

end Behavioral;
