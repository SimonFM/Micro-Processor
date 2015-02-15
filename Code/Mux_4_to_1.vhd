-- Simon Markham 12307233
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Mux_4_to_1 is
	port(s0, s1 : in STD_LOGIC;
			  in0, in1, in2, in3 : in STD_LOGIC_VECTOR(15 downto 0);
			  G : out STD_LOGIC_VECTOR(15 downto 0));
end Mux_4_to_1;

architecture Behavioral of Mux_4_to_1 is
	
begin
G <= in0 after 5 ns when s0 = '0' and s1 = '0' else
	  in1 after 5 ns when s0 = '1' and s1 = '0' else
	  in2 after 5 ns when s0 = '0' and s1 = '1' else
	  in3 after 5 ns when s0 = '1' and s1 = '1';

end Behavioral;

