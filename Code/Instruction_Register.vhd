-- Simon Markham 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Instruction_Register is
	port(load, CLK, reset : IN STD_LOGIC;
		  Q : OUT STD_LOGIC_VECTOR(15 downto 0);
		  D : IN STD_LOGIC_VECTOR(15 downto 0));
end Instruction_Register;

architecture Behavioral of Instruction_Register is
	signal outQ : STD_LOGIC_VECTOR(15 downto 0);
begin
	process(CLK)
	begin
		if (rising_edge(CLK)) then
			if load = '1' then
				Q <= D after 1 ns;
			end if;
		end if;
		if(reset = '1') then
			Q <= "0000000000000000";
		end if;
	end process;
end Behavioral;

