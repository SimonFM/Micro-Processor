-- Simon Markham 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Control_Unit_Test IS
END Control_Unit_Test;
ARCHITECTURE behavior OF Control_Unit_Test IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Control_Unit
    PORT(N : IN  std_logic;
         Z : IN  std_logic;
         V : IN  std_logic;
         C : IN  std_logic;
         Reset : IN  std_logic;
         D : IN  std_logic_vector(15 downto 0);
         PC_Data : OUT  std_logic_vector(15 downto 0);
         CARS_OUT : OUT  std_logic_vector(7 downto 0);
         DR : OUT  std_logic_vector(2 downto 0);
         SA : OUT  std_logic_vector(2 downto 0);
         SB : OUT  std_logic_vector(2 downto 0);
         MW : OUT  std_logic;
         MM : OUT  std_logic;
         RW : OUT  std_logic;
         MD : OUT  std_logic;
         MB : OUT  std_logic;
         IL : OUT  std_logic;
         TB : OUT  std_logic;
         TA : OUT  std_logic;
         TD : OUT  std_logic;
         PL : OUT  std_logic;
         PI : OUT  std_logic;
         MC : OUT  std_logic;
         NA : OUT  std_logic_vector(7 downto 0);
         FS : OUT  std_logic_vector(4 downto 0);
         MS : OUT std_logic_vector(2 downto 0);
         CLK : IN  std_logic);
    END COMPONENT;
   --Inputs
   signal N : std_logic := '0';
   signal Z : std_logic := '0';
   signal V : std_logic := '0';
   signal C : std_logic := '0';
   signal Reset : std_logic := '0';
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal NA : std_logic_vector(7 downto 0) := (others => '0');
   signal FS : std_logic_vector(4 downto 0) := (others => '0');
   signal MS : std_logic_vector(2 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal PC_Data : std_logic_vector(15 downto 0);
   signal CARS_OUT : std_logic_vector(7 downto 0);
   signal DR : std_logic_vector(2 downto 0);
   signal SA : std_logic_vector(2 downto 0);
   signal SB : std_logic_vector(2 downto 0);
   signal MW : std_logic;
   signal MM : std_logic;
   signal RW : std_logic;
   signal MD : std_logic;
   signal MB : std_logic;
   signal IL : std_logic;
   signal TB : std_logic;
   signal TA : std_logic;
   signal TD : std_logic;
   signal PL : std_logic;
   signal PI : std_logic;
   signal MC : std_logic;
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Control_Unit PORT MAP (
          N => N,
          Z => Z,
          V => V,
          C => C,
          Reset => Reset,
          D => D,
          PC_Data => PC_Data,
			 CARS_OUT => CARS_OUT,
          DR => DR,
          SA => SA,
          SB => SB,
          MW => MW,
          MM => MM,
          RW => RW,
          MD => MD,
          MB => MB,
          IL => IL,
          TB => TB,
          TA => TA,
          TD => TD,
          PL => PL,
          PI => PI,
          MC => MC,
          NA => NA,
          FS => FS,
          MS => MS,
          CLK => CLK
        );

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
		reset <= '1';
		wait for 100 ns;
		N <= '0';
		Z <= '0';
		C <= '0';
		V <= '0';
		Reset <= '0';
		D <= "0000000000000000";
      wait for CLK_period*10;
		N <= '0';
		Z <= '0';
		C <= '0';
		V <= '1';
		Reset <= '0';
		D <= "0000000000000001";
      wait for CLK_period*10;
		N <= '1';
		Z <= '1';
		C <= '1';
		V <= '1';
		Reset <= '0';
		D <= "0000000000000010";
      wait for CLK_period*10;
      wait;
   end process;
END;
