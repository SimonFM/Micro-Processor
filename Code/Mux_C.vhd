-- Simon Markham 12307233
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mux_C is
	port( s : in STD_LOGIC;
			data1, data2 : in STD_LOGIC_VECTOR(7 downto 0);
			z : out unsigned (7 downto 0));
end Mux_C;

architecture Behavioral of Mux_C is

begin
z <= data2 after 1 ns when s = '0' else
	  data1 after 1 ns when s = '1' else
	  "00000000" after 5ns;
end Behavioral;

