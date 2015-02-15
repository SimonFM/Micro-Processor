-- Simon Markham 12307233
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Extend_Test IS
END Extend_Test;
 
ARCHITECTURE behavior OF Extend_Test IS 

    COMPONENT Extend
    PORT(DR : IN  std_logic_vector(2 downto 0);
         SB : IN  std_logic_vector(2 downto 0);
         Q : OUT  std_logic_vector(15 downto 0));
    END COMPONENT;
   --Inputs
   signal DR : std_logic_vector(2 downto 0) := (others => '0');
   signal SB : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Extend PORT MAP(
          DR => DR,
          SB => SB,
          Q => Q);
   stim_proc: process
   begin		
      wait for 100 ns;	
		DR <= "001";
		SB <= "010";
		wait for 100 ns;
		DR <= "101";
		SB <= "010";
		wait for 100 ns;
      wait;
   end process;

END;
