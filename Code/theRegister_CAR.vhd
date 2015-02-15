-- @Simon Markham
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity theRegister_CAR is
	port( load : in STD_LOGIC;
			CLK : in STD_LOGIC;
			Reset : in STD_LOGIC;
			D : in STD_LOGIC_VECTOR(7 downto 0);
			Q : out STD_LOGIC_VECTOR(7 downto 0));
end theRegister_CAR;
-- Behaviour of how a register should operate.
architecture Behavioral of theRegister_CAR is
-- When the clock's rising edge matches that of the
-- the register, the register is accessed and the data is 
-- changed.
begin
	process(CLK)
	begin
		if (rising_edge(CLK)) then
			if load = '1' then
				Q <= D after 1 ns;
			end if;
		end if;
		if(reset = '1') then
			Q <= "00000000";
		end if;
	end process;
end Behavioral;