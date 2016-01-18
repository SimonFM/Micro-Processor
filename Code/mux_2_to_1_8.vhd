-- Simon Markham 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_to_1_8 is
	port(Z : OUT STD_LOGIC_VECTOR(7 downto 0);
		  D, P : IN STD_LOGIC_VECTOR(7 downto 0);
		  s : IN STD_LOGIC);
end mux_2_to_1_8;

architecture Behavioral of mux_2_to_1_8 is

begin
	Z <= P after 5 ns when s = '0' else
		  D after 5 ns when s = '1' else
		  "00000000";
end Behavioral;

