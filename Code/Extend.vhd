-- Simon Markham 12307233
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Extend is
	port(DR : IN STD_LOGIC_VECTOR(2 downto 0);
		  SB : IN STD_LOGIC_VECTOR(2 downto 0);
		  Q : OUT STD_LOGIC_VECTOR(15 downto 0));
end Extend;
architecture Behavioral of Extend is
	signal setBits : STD_LOGIC_VECTOR(9 downto 0);
	signal extend : STD_LOGIC_VECTOR(15 downto 0);
begin
	setBits <= "1111111111" when DR(2) = '1' else
				  "0000000000" after 5 ns;
	extend(15 downto 6) <= setBits;
	extend(5 downto 3) <= DR;
	extend(2 downto 0) <= SB;
	Q <= extend;
end Behavioral;