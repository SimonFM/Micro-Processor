-- Simon Markham 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PC_Test IS
END PC_Test;
 
ARCHITECTURE behavior OF PC_Test IS 
    COMPONENT PC
    PORT(PI : IN  std_logic;
         PL : IN  std_logic;
         Reset : IN  std_logic;
         CLK : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0);
         Extend : IN  std_logic_vector(15 downto 0));
    END COMPONENT;
   --Inputs
   signal PI : std_logic := '0';
   signal PL : std_logic := '0';
   signal Reset : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Extend : std_logic_vector(15 downto 0) := (others => '0');
 	--Outputs
   signal Q : std_logic_vector(15 downto 0);
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          PI => PI,
          PL => PL,
          CLK => CLK,
          Q => Q,
          Reset => Reset,
          Extend => Extend);
   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 100 ns;
		reset <= '1';
		wait for 100 ns;
		PI <= '0';
		PL <= '0';
		Reset <= '0';
		Extend <= "0000000000000010";		
      wait for CLK_period*10;
		PI <= '1';
		PL <= '0';
		Reset <= '0';
		Extend <= "0000000000010000";		
      wait for CLK_period*10;
		PI <= '0';
		PL <= '1';
		Reset <= '0';
      wait for CLK_period*10;
		PI <= '1';
		PL <= '1';
		Reset <= '0';
      wait for CLK_period*10;
      wait;
   end process;
END;
