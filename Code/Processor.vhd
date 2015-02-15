-- Simon Markham 12307233
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Processor is
	port(RESET, CLK : IN STD_LOGIC;
		  MemOut : OUT STD_LOGIC_VECTOR(15 downto 0);
		  CARSignal : OUT STD_LOGIC_VECTOR(7 downto 0);
		  PCSignal : OUT STD_LOGIC_VECTOR(15 downto 0));
end Processor;

architecture Behavioral of Processor is
	COMPONENT Control_Unit
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
	END COMPONENT;
	
	COMPONENT Datapath
		port(ASel0, ASel1, ASel2, Asel3 : in STD_LOGIC;
			  Bsel0, BSel1, BSel2, Bsel3 : in STD_LOGIC;
			  LoadEnable, MBSelect : in STD_LOGIC;
			  MDSelect, MFSelect, MMSelect : in STD_LOGIC;
			  A : in STD_LOGIC_VECTOR(15 downto 0);
			  sg0, sg1, sg2, sh0, sh1, cin : in STD_LOGIC;
			  d0, d1, d2, d3 : in STD_LOGIC;
			  MW : IN STD_LOGIC;
			  CLK : in STD_LOGIC;
			  dataIn : in STD_LOGIC_VECTOR(15 downto 0);
			  PC : in STD_LOGIC_VECTOR(15 downto 0);
			  dataOut : out STD_LOGIC_VECTOR(15 downto 0);
			  zeroFill : in STD_LOGIC_VECTOR(15 downto 0);
			  addressOut : out STD_LOGIC_VECTOR(15 downto 0);
			  MuxMout : out STD_LOGIC_VECTOR(15 downto 0));	
	END COMPONENT;
	COMPONENT memory_512
		Port( address : in unsigned(15 downto 0);
				write_data : in std_logic_vector(15 downto 0);
				MemWrite : in std_logic;
				read_data : out std_logic_vector(15 downto 0));
		END COMPONENT;
	-- Control Unit Signals
	signal N, V, C, Z : STD_LOGIC;
	signal outCarRegister : STD_LOGIC_VECTOR(7 downto 0);
	signal outPC : STD_LOGIC_VECTOR(15 downto 0);
	signal DRS, SAS, SAB : STD_LOGIC_VECTOR(2 downto 0);
	signal mux_S_Out, zero, one, MC_Select,
			 MW_Select, MM_Select, RW_Select,
			 MB_Select, MD_Select, IL_Select,
			 TB_Select, TA_Select, TD_Select,
			 PL_Select, PI_Select : STD_LOGIC;
	signal FS_Select : STD_LOGIC_VECTOR(4 downto 0);
	signal MS_Select : STD_LOGIC_VECTOR(2 downto 0);
	signal NA_Select : STD_LOGIC_VECTOR(7 downto 0);
	signal memory_512_Out :STD_LOGIC_VECTOR(15 downto 0);
	signal zeroFill :STD_LOGIC_VECTOR(15 downto 0);
	-- Datapath Signals
	signal Reg0, Reg1, Reg2, Reg3, Reg4,
			 Reg5, Reg6, Reg7, Reg8 : STD_LOGIC_VECTOR(15 downto 0);
	signal ZeroFillS : STD_LOGIC_VECTOR(15 downto 0);
	signal TDDR, TDSA, TBSB : STD_LOGIC_VECTOR(3 downto 0);
	-- In to the Memory
	signal dataInToMem : STD_LOGIC_VECTOR(15 downto 0);
	signal addressOut : STD_LOGIC_VECTOR(15 downto 0);
	signal muxOutM : STD_LOGIC_VECTOR(15 downto 0);
	signal dataOut : STD_LOGIC_VECTOR(15 downto 0);
begin
-- Concatanation here :D
	-- TD || DR
	TDDR(3) <= TD_Select;
	TDDR(2 downto 0) <= DRS;
	-- TD || SA
	TDSA(3) <= TD_Select;
	TDSA(2 downto 0) <= SAS;
	-- TB || SB
	TBSB(3) <= TB_Select;
	TBSB(2 downto 0) <= SAB;
	
	dataInToMem <= dataOut;
	-- Port mapping the component objects.
	-- Datapath works by itself.
	theDatapath : Datapath
		port map(TDSA(0), TDSA(1), TDSA(2), TDSA(3),
						TBSB(0), TBSB(1), TBSB(2), TBSB(3), RW_Select,
								MB_Select, MD_Select,FS_Select(3),
										MM_Select,ZeroFillS,
											FS_Select(0),FS_Select(1),FS_Select(2),FS_Select(3),
												FS_Select(1),FS_Select(2),
													TDDR(0),TDDR(1),TDDR(2),TDDR(3),MW_Select,
														CLK, outPC, dataOut, zeroFill,addressOut,muxOutM);
														
	-- Control path was tested and works by itself
	theControlUnit : control_Unit
		port map(N, Z, V, C, RESET, memory_512_Out, outPC,
					   outCarRegister, DRS, SAS, SAB,
							MW_Select, MM_Select, RW_Select, MD_Select, MB_Select,
								IL_Select, TB_Select, TA_Select, TD_Select, PL_Select,
									PI_Select, MC_Select, NA_Select, FS_Select, MS_Select, CLK);
	-- Memory works by itself
	instructionMem : memory_512
		port map(unsigned(dataInToMem),muxOutM,MW_Select,memOut);
		
	CARSignal <= outCarRegister;
	PCSignal <= outPC;
end Behavioral;

