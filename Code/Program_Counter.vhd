-- Simon Markham 12307233
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter is
	port(PI, PL, IL : IN STD_LOGIC;
		  CLK : in STD_LOGIC;
		  Q : OUT STD_LOGIC_VECTOR(15 downto 0);
		  D : IN STD_LOGIC_VECTOR(15 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

	COMPONENT Ripple_Adder is
    Port (cIn: in  STD_LOGIC;
			 CFlag, V : out STD_LOGIC;
			 A , B : in STD_LOGIC_VECTOR(15 downto 0);
			 G : out STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	-- storage
	COMPONENT theRegister 
		port( load : in STD_LOGIC;
				CLK : in STD_LOGIC;
				D : in STD_LOGIC_VECTOR(15 downto 0);
				Q : out STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	signal outG0 : STD_LOGIC_VECTOR(15 downto 0);
	signal outG1 : STD_LOGIC_VECTOR(15 downto 0);
	signal outR : STD_LOGIC_VECTOR(15 downto 0);
	signal cin,C,V : STD_LOGIC;
begin
	cin <= '0';
	rip1 : Ripple_Adder
		port map(cin,C,V,Q,"00000000000000001",outG0);
	rip0 : Ripple_Adder
		port map(cin,C,V,Q,D,outG1);
	reg : theRegister
		port map(IL,CLK,D,outR);
	process(CLK)
	begin
		if (rising_edge(CLK) and IL = '1') then
			if PI = '1' then
				Q <= outG0 after 1 ns;
			end if;
			if PL = '1' then
				Q <= outG1 after 1 ns;
			end if;
		end if;
	end process;
end Behavioral;

