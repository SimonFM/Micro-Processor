-- Simon Markham 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Program_Counter_test IS
END Program_Counter_test;
 
ARCHITECTURE behavior OF Program_Counter_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Program_Counter
    PORT(PI : IN  std_logic;
         PL : IN  std_logic;
         IL : IN  std_logic;
         CLK : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0);
         D : IN  std_logic_vector(15 downto 0));
    END COMPONENT;
    

   --Inputs
   signal PI : std_logic := '0';
   signal PL : std_logic := '0';
   signal IL : std_logic := '0';
   signal CLK : std_logic := '0';
   signal D : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Program_Counter PORT MAP (
          PI => PI,
          PL => PL,
          IL => IL,
          CLK => CLK,
          Q => Q,
          D => D);
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		PI <= '0';
		PL <= '0';
		IL <= '1';
		D <= "0000000000000001";
      wait for CLK_period*10;

      -- insert stimulus here 
      wait;
   end process;
END;
