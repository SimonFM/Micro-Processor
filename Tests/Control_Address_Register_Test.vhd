-- Simon Markham 12307233
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Control_Address_Register_Test IS
END Control_Address_Register_Test;
 
ARCHITECTURE behavior OF Control_Address_Register_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control_Address_Register
    PORT(Mux_S : IN  std_logic;
         CLK : IN  std_logic;
			RESET : IN STD_LOGIC;
         Q : OUT  std_logic_vector(7 downto 0);
         D : IN  std_logic_vector(7 downto 0));
    END COMPONENT;
    

   --Inputs
   signal Mux_S : std_logic := '0';
   signal Reset : std_logic := '0';
   signal CLK : std_logic := '0';
   signal D : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(7 downto 0);
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control_Address_Register PORT MAP (
          Mux_S => Mux_S,
          CLK => CLK,
			 Reset => Reset,
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
		wait for 100 ns;
  		Mux_S <= '0';
		D <= "00000010";
      wait for CLK_period*10;	
		Mux_S <= '1';
		D <= "00000001";
      wait for CLK_period*10;
		Mux_S <= '1';
		Reset <= '1';
		D <= "00000011";
      wait for CLK_period*10;
		Reset <= '0';
		Mux_S <= '0';
		D <= "00000111";
      wait for CLK_period*10;
      wait;
   end process;
END;
