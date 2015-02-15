-- Simon Markham 1230723
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY memory_256_test IS
END memory_256_test;
 
ARCHITECTURE behavior OF memory_256_test IS 
    COMPONENT control_memory_256
    PORT(MW, MM, RW, MD, MB, IL : OUT  std_logic;
         TA, TD, PL, PI, MC, TB : OUT  std_logic;
         FS : OUT  std_logic_vector(4 downto 0);
         MS : OUT  std_logic_vector(2 downto 0);
         NA : OUT  std_logic_vector(7 downto 0);
         IN_CAR : IN  std_logic_vector(7 downto 0));
    END COMPONENT;
   --Inputs
   signal IN_CAR : std_logic_vector(7 downto 0) := (others => '0');
 	--Outputs
   signal MW,MM,RW,MD,MB,IL : std_logic;
   signal TB,TA,TD,PL,PI,MC : std_logic;
   signal FS : std_logic_vector(4 downto 0);
   signal MS : std_logic_vector(2 downto 0);
   signal NA : std_logic_vector(7 downto 0);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_memory_256 PORT MAP(
          MW => MW,MM => MM,
          RW => RW,MD => MD,
          MB => MB,IL => IL,
          TB => TB,TA => TA,
          TD => TD,PL => PL,
          PI => PI,MC => MC,
          FS => FS,MS => MS,
          NA => NA,IN_CAR => IN_CAR);
   stim_proc: process
   begin		
      wait for 100 ns;	
		IN_CAR <= "00000000";
		wait for 100 ns;
		IN_CAR <= "00000001";
		wait for 100 ns;
		IN_CAR <= "00000010";
		wait for 100 ns;
		IN_CAR <= "00000011";
		wait for 100 ns;
		IN_CAR <= "00000100";
		wait for 100 ns;
      wait;
   end process;
END;