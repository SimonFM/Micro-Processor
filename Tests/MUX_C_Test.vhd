-- Simon Markham 12307233
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY MUX_C_Test IS
END MUX_C_Test;
 
ARCHITECTURE behavior OF MUX_C_Test IS 
    COMPONENT mux_2_to_1_8
    PORT(Z : OUT  std_logic_vector(7 downto 0);
         D : IN  std_logic_vector(7 downto 0);
         P : IN  std_logic_vector(7 downto 0);
         s : IN  std_logic);
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(7 downto 0) := (others => '0');
   signal P : std_logic_vector(7 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal Z : std_logic_vector(7 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_2_to_1_8 PORT MAP (
          Z => Z,
          D => D,
          P => P,
          s => s);

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		wait for 100 ns;
      wait;
   end process;

END;
