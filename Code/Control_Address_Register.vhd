-- Simon Markham 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Control_Address_Register is
	port(Mux_S: IN STD_LOGIC;
		  CLK : IN STD_LOGIC;
		  Reset : IN STD_LOGIC;
		  Q : OUT STD_LOGIC_VECTOR(7 downto 0);
		  D : IN STD_LOGIC_VECTOR(7 downto 0));
end Control_Address_Register;
architecture Behavioral of Control_Address_Register is
	-- Adder
	COMPONENT ArithmeticUnit_16 
    Port (s0, s1, cIn: in  STD_LOGIC;
			 CFlag, V : out STD_LOGIC;
			 A , B : in STD_LOGIC_VECTOR(15 downto 0);
			 G : out STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	-- modified register
	COMPONENT theRegister_CAR
		port(load : in STD_LOGIC;
			  CLK : in STD_LOGIC;
			  Reset : in STD_LOGIC;
			  D : in STD_LOGIC_VECTOR(7 downto 0);
			  Q : out STD_LOGIC_VECTOR(7 downto 0));
	END COMPONENT;
	
	COMPONENT  mux_2_to_1_8
		port(D, P : IN STD_LOGIC_VECTOR(7 downto 0);
			  s : IN STD_LOGIC;
			  Z : OUT STD_LOGIC_VECTOR(7 downto 0));
	END COMPONENT;
	
	signal qOut, concatAdd : STD_LOGIC_VECTOR(15 downto 0);
	signal rOut, muxOut : STD_LOGIC_VECTOR(7 downto 0);
	signal load, s, flagC, flagV : STD_LOGIC;
begin
	s <= '0';
	load <= '1';
	concatAdd(15 downto 8) <= "00000000";
	concatAdd(7 downto 0) <= rOut;
	
	multiplexer : mux_2_to_1_8
		PORT MAP(D,qOut(7 downto 0),Mux_S,muxOut);
	adder : ArithmeticUnit_16 
		Port Map(s,s,NOT(Mux_S),flagC,flagV,"0000000000000000",concatAdd,qOut);
	reg : theRegister_CAR
		PORT MAP(load,CLK,Reset,muxOut,rOut);	
	Q <= rOut;
end Behavioral;
