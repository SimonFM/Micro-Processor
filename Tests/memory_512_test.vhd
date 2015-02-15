-- Simon Markham
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY memory_512_Test IS
END memory_512_Test;
 
ARCHITECTURE behavior OF memory_512_Test IS 

    COMPONENT memory_512
    PORT(
         address : IN  unsigned(15 downto 0);
         write_data : IN  std_logic_vector(15 downto 0);
         MemWrite : IN  std_logic;
         read_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : unsigned(15 downto 0) := (others => '0');
   signal write_data : std_logic_vector(15 downto 0) := (others => '0');
   signal MemWrite : std_logic := '0';

 	--Outputs
   signal read_data : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memory_512 PORT MAP (
          address => address,
          write_data => write_data,
          MemWrite => MemWrite,
          read_data => read_data);

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      address <= "0000000000000000"; 
      write_data <= "0000000000000001"; 
		MemWrite <= '1';
		wait for 100 ns;
		address <= "0000000000000000"; 
      write_data <= "0000000000000000"; 
		MemWrite <= '0';
		wait for 100 ns;
      wait;
   end process;

END;
