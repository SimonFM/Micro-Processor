-- Simon Markham 12307233
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RegisterFile_NewTest IS
END RegisterFile_NewTest;
 
ARCHITECTURE behavior OF RegisterFile_NewTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerFile
    PORT(
         Ainput0,Ainput1,Ainput2,Ainput3 : IN  std_logic;
         Binput0,Binput1,Binput2,Binput3 : IN  std_logic;
         d1 : IN  std_logic;
         d2 : IN  std_logic;
         d3 : IN  std_logic;
         d4 : IN  std_logic;
         CLK : IN  std_logic;
         load : IN  std_logic;
         R1 : OUT  std_logic_vector(15 downto 0);
         R2 : OUT  std_logic_vector(15 downto 0);
         R3 : OUT  std_logic_vector(15 downto 0);
         R4 : OUT  std_logic_vector(15 downto 0);
         R5 : OUT  std_logic_vector(15 downto 0);
         R6 : OUT  std_logic_vector(15 downto 0);
         R7 : OUT  std_logic_vector(15 downto 0);
         R8 : OUT  std_logic_vector(15 downto 0);
         R9 : OUT  std_logic_vector(15 downto 0);
         A : OUT  std_logic_vector(15 downto 0);
         B : OUT  std_logic_vector(15 downto 0);
         dataIn : IN  std_logic_vector(15 downto 0));
    END COMPONENT;
    

   --Inputs
   signal Ainput0 : std_logic := '0';
   signal Ainput1 : std_logic := '0';
   signal Ainput2 : std_logic := '0';
   signal Ainput3 : std_logic := '0';
   signal Binput0 : std_logic := '0';
   signal Binput1 : std_logic := '0';
   signal Binput2 : std_logic := '0';
   signal Binput3 : std_logic := '0';
   signal d1 : std_logic := '0';
   signal d2 : std_logic := '0';
   signal d3 : std_logic := '0';
   signal d4 : std_logic := '0';
   signal CLK : std_logic := '0';
   signal load : std_logic := '0';
   signal dataIn : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal R1 : std_logic_vector(15 downto 0);
   signal R2 : std_logic_vector(15 downto 0);
   signal R3 : std_logic_vector(15 downto 0);
   signal R4 : std_logic_vector(15 downto 0);
   signal R5 : std_logic_vector(15 downto 0);
   signal R6 : std_logic_vector(15 downto 0);
   signal R7 : std_logic_vector(15 downto 0);
   signal R8 : std_logic_vector(15 downto 0);
   signal R9 : std_logic_vector(15 downto 0);
   signal A : std_logic_vector(15 downto 0);
   signal B : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerFile PORT MAP (
          Ainput0 => Ainput0,
          Ainput1 => Ainput1,
          Ainput2 => Ainput2,
          Ainput3 => Ainput3,
          Binput0 => Binput0,
          Binput1 => Binput1,
          Binput2 => Binput2,
          Binput3 => Binput3,
          d1 => d1,
          d2 => d2,
          d3 => d3,
          d4 => d4,
          CLK => CLK,
          load => load,
          R1 => R1,
          R2 => R2,
          R3 => R3,
          R4 => R4,
          R5 => R5,
          R6 => R6,
          R7 => R7,
          R8 => R8,
          R9 => R9,
          A => A,
          B => B,
          dataIn => dataIn);

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
		dataIn <= "0000000000000000";
		Ainput0 <='0';
		Ainput1 <='0';
		Ainput2 <='0';
		Ainput3 <='0';
		
		Binput0 <= '0';
		Binput1 <= '0';
		Binput2 <= '0';
		Binput3 <= '0';
		
		d1 <= '0';
		d2 <= '0';
		d3 <= '0';
		d4 <= '0';
		
		load <= '1';
		
      wait for CLK_period*10;
		dataIn <= "0000000000000001";
		
		Ainput0 <='1';
		Ainput1 <='0';
		Ainput2 <='0';
		Ainput3 <='0';
		
		Binput0 <= '1';
		Binput1 <= '0';
		Binput2 <= '0';
		Binput3 <= '0';
		d1 <= '1';
		d2 <= '0';
		d3 <= '0';
		d4 <= '0';
      wait for CLK_period*10;
		dataIn <= "0000000000000010";
		Ainput0 <='0';
		Ainput1 <='1';
		Ainput2 <='0';
		Ainput3 <='0';
		
		Binput0 <= '0';
		Binput1 <= '1';
		Binput2 <= '0';
		Binput3 <= '0';
		d1 <= '0';
		d2 <= '1';
		d3 <= '0';
		d4 <= '0';
      wait for CLK_period*10;
		dataIn <= "0000000000000011";
		Ainput0 <='1';
		Ainput1 <='1';
		Ainput2 <='0';
		Ainput3 <='0';
		
		Binput0 <= '1';
		Binput1 <= '1';
		Binput2 <= '0';
		Binput3 <= '0';
		
		d1 <= '1';
		d2 <= '1';
		d3 <= '0';
		d4 <= '0';
      wait for CLK_period*10;
		dataIn <= "0000000000000100";
		
		Ainput0 <='1';
		Ainput1 <='1';
		Ainput2 <='0';
		Ainput3 <='0';
		
		Binput0 <= '1';
		Binput1 <= '1';
		Binput2 <= '0';
		Binput3 <= '0';
		
		d1 <= '0';
		d2 <= '0';
		d3 <= '1';
		d4 <= '0';
      wait for CLK_period*10;
		dataIn <= "0000000000000101";
		
		Ainput0 <='0';
		Ainput1 <='0';
		Ainput2 <='1';
		Ainput3 <='0';
		
		Binput0 <= '0';
		Binput1 <= '0';
		Binput2 <= '1';
		Binput3 <= '0';
		
		d1 <= '1';
		d2 <= '0';
		d3 <= '1';
		d4 <= '0';
      wait for CLK_period*10;
		dataIn <= "0000000000000110";
		Ainput0 <='1';
		Ainput1 <='0';
		Ainput2 <='1';
		Ainput3 <='0';
		
		Binput0 <= '1';
		Binput1 <= '0';
		Binput2 <= '1';
		Binput3 <= '0';
		d1 <= '0';
		d2 <= '1';
		d3 <= '1';
		d4 <= '0';
      wait for CLK_period*10;
		dataIn <= "0000000000000110";
		
		Ainput0 <='0';
		Ainput1 <='1';
		Ainput2 <='1';
		Ainput3 <='0';
		
		Binput0 <= '0';
		Binput1 <= '1';
		Binput2 <= '1';
		Binput3 <= '0';
		
		d1 <= '1';
		d2 <= '1';
		d3 <= '1';
		d4 <= '0';
      wait for CLK_period*10;
		dataIn <= "0000000000000111";
		
		Ainput0 <='1';
		Ainput1 <='1';
		Ainput2 <='1';
		Ainput3 <='0';
		
		Binput0 <= '1';
		Binput1 <= '1';
		Binput2 <= '1';
		Binput3 <= '0';
		
		d1 <= '0';
		d2 <= '0';
		d3 <= '0';
		d4 <= '1';	
		wait for CLK_period*100;
		dataIn <= "0000000000001000";
		
		Ainput0 <='0';
		Ainput1 <='0';
		Ainput2 <='0';
		Ainput3 <='1';
		
		Binput0 <= '0';
		Binput1 <= '0';
		Binput2 <= '0';
		Binput3 <= '1';
		
		d1 <= '0';
		d2 <= '0';
		d3 <= '0';
		d4 <= '1';	
		wait for CLK_period*10;

      wait;
   end process;

END;
