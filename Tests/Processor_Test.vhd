-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  use IEEE.STD_LOGIC_ARITH.ALL;


  ENTITY Processor_Test IS
  END Processor_Test;

  ARCHITECTURE behavior OF Processor_Test IS 

  -- Component Declaration
          COMPONENT Processor
				port(RESET, CLK : IN STD_LOGIC;
					  MemOut : OUT STD_LOGIC_VECTOR(15 downto 0);
					  CARSignal : OUT STD_LOGIC_VECTOR(7 downto 0);
					  PCSignal : OUT STD_LOGIC_VECTOR(15 downto 0));
          END COMPONENT;

          SIGNAL RESET, CLK:  std_logic;
          SIGNAL MemOut :  std_logic_vector(15 downto 0);
          SIGNAL PCSignal :  std_logic_vector(15 downto 0);
          SIGNAL CARSignal :  std_logic_vector(7 downto 0);
          -- Clock period definitions
			constant CLK_period : time := 10 ns;

  BEGIN

  -- Component Instantiation
          uut: Processor
				port map(RESET => RESET,
							CLK => CLK,
							PCSignal => PCSignal,
							CARSignal => CARSignal,
							MemOut => memOut);

	CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
  --  Test Bench Statements
     testBench : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes	
		  RESET <= '1';
		  wait for CLK_period*10;
		  RESET <= '0';
		  wait for CLK_period*10;
		  wait for CLK_period*10;
		  wait for CLK_period*10;
		  wait for CLK_period*10;
		  wait for CLK_period*10;
		  wait for CLK_period*10;
		   RESET <= '1';
		  wait for CLK_period*10;
		  RESET <= '0';
		  wait for CLK_period*10;
		  wait;
     END PROCESS testBench;
  --  End Test Bench 

  END;
