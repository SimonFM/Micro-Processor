-- Simon Markham 12307233
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity PC is
	port(PI, PL, Reset: IN STD_LOGIC;
		  CLK : in STD_LOGIC;
		  Q : OUT STD_LOGIC_VECTOR(15 downto 0);
		  Extend : IN STD_LOGIC_VECTOR(15 downto 0));
end PC;
architecture Behavioral of PC is
	-- Adder
	COMPONENT ArithmeticUnit_16 
    Port (s0, s1, cIn: in  STD_LOGIC;
			 CFlag, V : out STD_LOGIC;
			 A , B : in STD_LOGIC_VECTOR(15 downto 0);
			 G : out STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	-- modified register
	COMPONENT Register_With_Mod
		port(load : in STD_LOGIC;
			  CLK : in STD_LOGIC;
			  Reset : in STD_LOGIC;
			  D : in STD_LOGIC_VECTOR(15 downto 0);
			  Q : out STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	
	signal qOut : STD_LOGIC_VECTOR(15 downto 0);
	signal rOut : STD_LOGIC_VECTOR(15 downto 0);
	signal load : STD_LOGIC;
	signal s : STD_LOGIC;
	signal flagC : STD_LOGIC;
	signal flagV : STD_LOGIC;
begin
	s <= '0';
	load <= (PI OR PL);
	adder : ArithmeticUnit_16 
		Port Map(PL, s, PI, flagC, flagV, rOut , Extend, qOut);
	reg : Register_With_Mod
		PORT MAP(load, CLK, reset, qOut, rOut);	
	Q <= qOut;
end Behavioral;