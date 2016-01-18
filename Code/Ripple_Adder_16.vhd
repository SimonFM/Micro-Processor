-- Simon Markham 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArithmeticUnit_16 is
    Port (s0, s1, cIn: in  STD_LOGIC;
			  CFlag,V : out STD_LOGIC;
			  A , B : in STD_LOGIC_VECTOR(15 downto 0);
			  G : out STD_LOGIC_VECTOR(15 downto 0));
end ArithmeticUnit_16;
architecture Behavioral of ArithmeticUnit_16 is
	signal C : STD_LOGIC_VECTOR(15 downto 0);
	COMPONENT FullAdder
		port(x,y,z : in STD_LOGIC;
			  s, c  : out STD_LOGIC);
	END COMPONENT;
	signal Cvec : STD_LOGIC_VECTOR(15 downto 0);
	signal Gout : STD_LOGIC_VECTOR(15 downto 0);
	signal localV : STD_LOGIC;
	signal localC : STD_LOGIC;
	signal B0,B1,B2,B3,B4,B5,B6,B7,B8,
			 B9,B10,B11,B12,B13,B14,B15 : STD_LOGIC;
begin
	fullAdder0 : FullAdder
		port map(A(0),B(0),cIn,Gout(0),Cvec(0));
	fullAdder1 : FullAdder
		port map(A(1),B(1),Cvec(0),Gout(1),Cvec(1));
	fullAdder2 : FullAdder
		port map(A(2),B(2),Cvec(1),Gout(2),Cvec(2));
	fullAdder3 : FullAdder
		port map(A(3),B(3),Cvec(2),Gout(3),Cvec(3));
	fullAdder4 : FullAdder
		port map(A(4),B(4),Cvec(3),Gout(4),Cvec(4));
	fullAdder5 : FullAdder
		port map(A(5),B(5),Cvec(4),Gout(5),Cvec(5));
	fullAdder6 : FullAdder
		port map(A(6),B(6),Cvec(5),Gout(6),Cvec(6));
	fullAdder7 : FullAdder
		port map(A(7),B(7),Cvec(6),Gout(7),Cvec(7));
	fullAdder8 : FullAdder
		port map(A(8),B(8),Cvec(7),Gout(8),Cvec(8));
	fullAdder9 : FullAdder
		port map(A(9),B(9),Cvec(8),Gout(9),Cvec(9));
	fullAdder10 : FullAdder
		port map(A(10),B(10),Cvec(9),Gout(10),Cvec(10));
	fullAdder11 : FullAdder
		port map(A(11),B(11),Cvec(10),Gout(11),Cvec(11));
	fullAdder12 : FullAdder
		port map(A(12),B(12),Cvec(11),Gout(12),Cvec(12));
	fullAdder13 : FullAdder
		port map(A(13),B(13),Cvec(12),Gout(13),Cvec(13));
	fullAdder14 : FullAdder
		port map(A(14),B(14),Cvec(14),Gout(14),Cvec(14));
	fullAdder15 : FullAdder
		port map(A(15),B(15),Cvec(15),Gout(15),Cvec(15));
		CFlag <= Cvec(15);
		localV <= Gout(15) XOR Gout(14);
		V <= localV;
		G <= Gout;
end Behavioral;
