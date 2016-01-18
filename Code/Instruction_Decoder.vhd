-- Simon Markham 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
	port(Instruction : in STD_LOGIC_VECTOR(15 downto 0);
		  CONTROL_WORD : out STD_LOGIC_VECTOR(22 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

-- signals for each AND, OR, NOT Operation needed to go
-- into the CONTROL_WORD
	signal MD, RW, MW, PL, JB, MB : STD_LOGIC;
	signal DA, AA, BA, BC : STD_LOGIC_VECTOR(2 downto 0);
	signal FSSignal : STD_LOGIC_VECTOR(12 downto 8);
	
	signal opcodeSignal : STD_LOGIC_VECTOR(15 downto 9);
	signal DR : STD_LOGIC_VECTOR(8 downto 6);
	signal SA : STD_LOGIC_VECTOR(5 downto 3);
	signal SB : STD_LOGIC_VECTOR(2 downto 0);
	signal tempFS : STD_LOGIC_VECTOR(12 downto 8);
begin
	DR <= Instruction(8 downto 6);
	SA <= Instruction(5 downto 3);
	SB <= Instruction(2 downto 0);
	
	DA <= DR;
	AA <= SA;
	BA <= SB; -- BA BARACUS
	
	BC(0) <= Instruction(9);
	BC(1) <= Instruction(10);
	BC(2) <= Instruction(11);
	
	JB <= Instruction(13);
	PL <= (Instruction(14))AND(Instruction(15));
	MW <= Instruction(14) AND NOT Instruction(13)AND NOT Instruction(15);
	RW <= NOT(Instruction(14))OR(Instruction(13)AND NOT Instruction(15));
	MB <= Instruction(15);
	MD <= Instruction(14);
	
	FSSignal(8) <= NOT(PL) AND Instruction(9);
	FSSignal(9) <= NOT(PL) AND Instruction(10);
	FSSignal(10) <= NOT(PL) AND Instruction(11);
	FSSignal(11) <= NOT(PL) AND Instruction(12);
	FSSignal(12) <= NOT(PL) AND Instruction(13);
	
	CONTROL_WORD(2 downto 0) <= BC;
	CONTROL_WORD(3) <= JB;
	CONTROL_WORD(4) <= PL;
	CONTROL_WORD(5) <= MW;
	CONTROL_WORD(6) <= RW;
	CONTROL_WORD(7) <= MD;
	CONTROL_WORD(12 downto 8) <= FSSignal;
	CONTROL_WORD(13) <= MB;
	CONTROL_WORD(16 downto 14) <= BA;
	CONTROL_WORD(19 downto 17) <= AA;
	CONTROL_WORD(22 downto 20) <= DA;
	
end Behavioral;

