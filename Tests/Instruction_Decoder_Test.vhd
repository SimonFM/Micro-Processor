-- Simon Markham 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Instruction_Decoder_Test IS
END Instruction_Decoder_Test;
ARCHITECTURE behavior OF Instruction_Decoder_Test IS 
    COMPONENT Instruction_Decoder
    PORT(Instruction : IN  std_logic_vector(15 downto 0);
         CONTROL_WORD : OUT  std_logic_vector(22 downto 0));
    END COMPONENT;
   --Inputs
   signal Instruction : std_logic_vector(15 downto 0) := (others => '0');
 	--Outputs
   signal CONTROL_WORD : std_logic_vector(22 downto 0);
BEGIN
   uut: Instruction_Decoder PORT MAP(
          Instruction => Instruction,
          CONTROL_WORD => CONTROL_WORD);
   stim_proc: process
   begin		
      wait for 100 ns;	
		Instruction <= "0000000000000000";
      wait for 100 ns;
		Instruction <= "0000000000000001";
      wait for 100 ns;		
      wait;
   end process;

END;
