-- Simon Markham 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Mux_S_Test IS
END Mux_S_Test;
 
ARCHITECTURE behavior OF Mux_S_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_S
    PORT(in0 : IN  std_logic;
         in1 : IN  std_logic;
         in2 : IN  std_logic;
         in3 : IN  std_logic;
         in4 : IN  std_logic;
         in5 : IN  std_logic;
         in6 : IN  std_logic;
         in7 : IN  std_logic;
         MSelect : IN  std_logic_vector(2 downto 0);
         Z : OUT  std_logic);
    END COMPONENT;
    

   --Inputs
   signal in0 : std_logic := '0';
   signal in1 : std_logic := '0';
   signal in2 : std_logic := '0';
   signal in3 : std_logic := '0';
   signal in4 : std_logic := '0';
   signal in5 : std_logic := '0';
   signal in6 : std_logic := '0';
   signal in7 : std_logic := '0';
   signal MSelect : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_S PORT MAP (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          in5 => in5,
          in6 => in6,
          in7 => in7,
          MSelect => MSelect,
          Z => Z);


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		in0 <= '1';
		in1 <= '1';
		in2 <= '1';
		in3 <= '0';
		in4 <= '0';
		in5 <= '1';
		in6 <= '1';
		in7 <= '1';
		MSelect <= "000";
		wait for 100 ns;
		MSelect <= "001";
		wait for 100 ns;
		MSelect <= "010";
		wait for 100 ns;
		MSelect <= "011";
		wait for 100 ns;
		MSelect <= "100";
		wait for 100 ns;
		MSelect <= "101";
		wait for 100 ns;
		MSelect <= "110";
		wait for 100 ns;
		MSelect <= "111";
		wait for 100 ns;
      wait;
   end process;
END;
