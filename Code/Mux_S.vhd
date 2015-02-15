-- Simon Markham 12307233
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Mux_S is
	port(in0,in1,in2,in3,in4,in5,in6,in7 : IN STD_LOGIC;
		  MSelect : IN STD_LOGIC_VECTOR(2 downto 0);
		  Z : OUT STD_LOGIC);
end Mux_S;
architecture Behavioral of Mux_S is
begin
	Z <= in0 after 5 ns when MSelect = "000" else -- 0
	     in1 after 5 ns when MSelect = "001" else -- 1
	     in2 after 5 ns when MSelect = "010" else -- C
	     in3 after 5 ns when MSelect = "011" else -- V
	     in4 after 5 ns when MSelect = "100" else -- Z
	     in5 after 5 ns when MSelect = "101" else -- N
	     in6 after 5 ns when MSelect = "110" else -- NOT C
	     in7 after 5 ns when MSelect = "111"; -- NOT Z
end Behavioral;