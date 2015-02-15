-- Simon Markham 12307233
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux2_unsigned is
	port( s : in STD_LOGIC;
			data1, data2 : in STD_LOGIC_VECTOR(15 downto 0);
			z : out unsigned (15 downto 0));
end mux2_unsigned;

architecture Behavioral of mux2_unsigned is

begin
z <= data2 after 1 ns when s = '0' else
	  data1 after 1 ns when s = '1' else
	  "0000000000000000" after 5ns;
end Behavioral;

