library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
	entity memory_512 is
		Port( address : in unsigned(15 downto 0);
				write_data : in std_logic_vector(15 downto 0);
				MemWrite : in std_logic;
				read_data : out std_logic_vector(15 downto 0));
end memory_512;

architecture Behavioral of memory_512 is
type mem_array is array(511 downto 0) of std_logic_vector(15 downto 0);
-- define type, for memory arrays
begin 
	mem_process: process(address, write_data, MemWrite)
	-- initialize data memory, X denotes hexadecimal number
	variable data_mem : mem_array := (
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000",
					X"0000", X"0000", X"0000",X"0000");
	variable addr:integer;
	
	begin-- the following type conversion function is in std_logic_arith
		addr := conv_integer(address(9 downto 0)); 
		if MemWrite = '1' then
			data_mem(addr):= write_data; 
		else 
				read_data <= data_mem(addr) after 10 ns; 
		end if;
	end process;
end Behavioral;