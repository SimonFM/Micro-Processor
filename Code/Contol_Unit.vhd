-- Simon Markham 12307233
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Control_Unit is
	port(N,Z,V,C : IN STD_LOGIC;
	     Reset: IN STD_LOGIC;
		  D : IN STD_LOGIC_VECTOR(15 downto 0);
		  PC_Data : OUT STD_LOGIC_VECTOR(15 downto 0);
		  CARS_OUT : OUT STD_LOGIC_VECTOR(7 downto 0);
		  DR, SA, SB : OUT STD_LOGIC_VECTOR(2 downto 0);
		  MW, MM, RW, MD, MB, IL : OUT STD_LOGIC;
		  TB, TA, TD, PL, PI, MC : OUT STD_LOGIC;
		  NA : OUT STD_LOGIC_VECTOR(7 downto 0);
		  FS : OUT STD_LOGIC_VECTOR(4 downto 0);
		  MS : OUT STD_LOGIC_VECTOR(2 downto 0);
		  CLK : IN STD_LOGIC);
end Control_Unit;
architecture Behavioral of Control_Unit is
	COMPONENT mux_2_to_1_8
		port(Z : OUT STD_LOGIC_VECTOR(7 downto 0);
			  D, P : IN STD_LOGIC_VECTOR(7 downto 0);
			  s : IN STD_LOGIC);
	END COMPONENT;
	COMPONENT  Mux_S
		port(in0,in1,in2,in3 : IN  std_logic;
           in4,in5,in6,in7 : IN  std_logic;
           MSelect : IN  std_logic_vector(2 downto 0);
           Z : OUT  std_logic);
	END COMPONENT;
	COMPONENT mux_4_to_1
		port(zero, G : in STD_LOGIC;
			  QandZ : in STD_LOGIC_VECTOR(1 downto 0);
			  s0, s1 : in STD_LOGIC;
			  Qout : out STD_LOGIC);
	END COMPONENT;
	COMPONENT PC 
		port(PI, PL, Reset: IN STD_LOGIC;
			  CLK : in STD_LOGIC;
		     Q : OUT STD_LOGIC_VECTOR(15 downto 0);
		     Extend : IN STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	COMPONENT Control_Address_Register
	port(Mux_S: IN STD_LOGIC;
		  CLK : IN STD_LOGIC;
		  Reset : IN STD_LOGIC;
		  Q : OUT STD_LOGIC_VECTOR(7 downto 0);
		  D : IN STD_LOGIC_VECTOR(7 downto 0));
	END COMPONENT;
	COMPONENT control_memory_256
	port( MW, MM, RW, MD, MB, IL : out STD_LOGIC;
			TB, TA, TD, PL, PI, MC : out STD_LOGIC;
			FS : out STD_LOGIC_VECTOR(4 downto 0);
			MS : out STD_LOGIC_VECTOR(2 downto 0);
			NA : out STD_LOGIC_VECTOR(7 downto 0);
			IN_CAR : in STD_LOGIC_VECTOR(7 downto 0));
	END COMPONENT;
	
	COMPONENT Instruction_Register is
		port(load, CLK, reset : IN STD_LOGIC;
			  Q : OUT STD_LOGIC_VECTOR(15 downto 0);
			  D : IN STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	COMPONENT Extend is
		port(DR : IN STD_LOGIC_VECTOR(2 downto 0);
			  SB : IN STD_LOGIC_VECTOR(2 downto 0);
			  Q : OUT STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	signal FlagsNZVC : STD_LOGIC_VECTOR(3 downto 0);
	signal FlagsZandC : STD_LOGIC_VECTOR(1 downto 0);
	signal MSelectS : STD_LOGIC_VECTOR(2 downto 0);
	signal CAR_OUT : STD_LOGIC_VECTOR(7 downto 0);
	signal MUX_C_OUT : STD_LOGIC_VECTOR(7 downto 0);
	signal Next_Address : STD_LOGIC_VECTOR(7 downto 0);
	signal mux_S_Out,zero, one, MC_Select,
			 MW_Select, MM_Select, RW_Select,
			 MB_Select, MD_Select, IL_Select,
			 TB_Select, TA_Select, TD_Select,
			 PL_Select, PI_Select : STD_LOGIC;
	signal FS_Select : STD_LOGIC_VECTOR(4 downto 0);
	signal MS_Select : STD_LOGIC_VECTOR(2 downto 0);
	signal NA_Select : STD_LOGIC_VECTOR(7 downto 0);
	signal ExtendS : STD_LOGIC_VECTOR(15 downto 0);
	signal PC_Out : STD_LOGIC_VECTOR(15 downto 0);
	signal IR_Out : STD_LOGIC_VECTOR(15 downto 0);
	signal OPCODE : STD_LOGIC_VECTOR(7 downto 0);
	signal DRS, SAS, SBS : STD_LOGIC_VECTOR(2 downto 0);
begin
-- Setting FLags
	FlagsZandC(1) <= NOT(Z);-- Zero flag
	FlagsZandC(0) <= NOT(C);-- Carry Flag
	OPCODE(7) <= '0';
	OPCODE(6 downto 0) <= IR_OUT(15 downto 9);
	one <= '1';
	zero <= '0';
	-- MUX_S
	mux_S_Comp : Mux_S
		port map(zero,one,FlagsZandC(0),FlagsZandC(1),N,Z,V,C,MS_Select,mux_S_Out);
	-- CONTROL ADDRESS REGISTER
	CAR : Control_Address_Register
		port map(mux_S_Out,CLK,Reset,CAR_OUT,MUX_C_OUT);
	-- MUX with flags, zero and one	
	Mux_C : mux_2_to_1_8
		port map(MUX_C_OUT,OPCODE,Next_Address,MC_Select);
	-- control memory
	cont_mem : control_memory_256
		port map( MW_Select, MM_Select, RW_Select, MD_Select, MB_Select, IL_Select,
					 TB_Select, TA_Select, TD_Select, PL_Select, PI_Select, MC_Select,
					 FS_Select, MS_Select, NA_Select, CAR_OUT);
	-- Instruction Register
	instructionReg : Instruction_Register
		port map(IL_Select, CLK, Reset,IR_Out,D);
	-- Program Counter
	Prog_Counter :  PC 
		port map(PI_Select, PL_Select, Reset, CLK, PC_Out, ExtendS);
		
	-- EXTEND IN TO PC	
	theExtend : Extend 
		port map(DRS,SBS,ExtendS);
	DRS <= IR_OUT(8 downto 6);
	SAS <= IR_OUT(5 downto 3);
	SBS <= IR_OUT(2 downto 0);
	DR <= DRS;
	SA <= SAS;
	SB <= SBS;
	-- Output Signals
	MW <= MW_Select;
	MD <= MD_Select;
	MC <= MC_Select;
	MB <= MB_Select;
	MM <= MM_Select;
	RW <= RW_Select;
	IL <= IL_Select;
	TA <= TA_Select;
	TB <= TB_Select;
	TD <= TD_Select;
	PL <= PL_Select;
	PI <= PI_Select;
	FS <= FS_Select;
	MS <= MS_Select;
	NA <= NA_Select;
	-- DR,SB,SA Values
	DR <= DRS;
	SA <= SAS;
	SB <= SBS;
	PC_Data <= PC_OUT;
	CARS_OUT <= CAR_OUT;
end Behavioral;