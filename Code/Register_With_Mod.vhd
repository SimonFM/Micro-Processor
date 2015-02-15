-- @Simon Markham
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Register_With_Mod is
	port( load : in STD_LOGIC;
			CLK : in STD_LOGIC;
			Reset : IN STD_LOGIC;
			D : in STD_LOGIC_VECTOR(15 downto 0);
			Q : out STD_LOGIC_VECTOR(15 downto 0));
end Register_With_Mod;
-- Behaviour of how a register should operate.
architecture Behavioral of Register_With_Mod is
-- When the clock's rising edge matches that of the
-- the register, the register is accessed and the data is 
-- changed.
begin
	process(CLK)
	begin
		if (falling_edge(CLK)) then
			if load = '1' then
				Q <= D after 1 ns;
			end if;
		end if;
			if Reset = '1' then
				Q <= "0000000000000000";
			end if;
	end process;
end Behavioral;