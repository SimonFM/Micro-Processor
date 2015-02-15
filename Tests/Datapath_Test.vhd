-- Simon Markham 12307233
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Datapath_Test IS
END Datapath_Test;
 
ARCHITECTURE behavior OF Datapath_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Datapath
    PORT(ASel0,ASel1,ASel2,Asel3 : IN  std_logic;
         Bsel0,BSel1,BSel2,Bsel3 : IN  std_logic;
         LoadEnable : IN  std_logic;
         MBSelect,MDSelect,MFSelect,MMSelect : IN  std_logic;
         A : IN  std_logic_vector(15 downto 0);
         sg0,sg1,sg2 : IN  std_logic;
         sh0,sh1,cin : IN  std_logic;
         d0,d1,d2,d3 : IN  std_logic;
         MW : IN  std_logic;
         CLK : IN  std_logic;
         dataIn : IN  std_logic_vector(15 downto 0);
         PC : IN  std_logic_vector(15 downto 0);
         dataOut : OUT  std_logic_vector(15 downto 0);
         zeroFill : IN  std_logic_vector(15 downto 0);
         addressOut : OUT  std_logic_vector(15 downto 0);
         muxMOut : OUT  std_logic_vector(15 downto 0));
    END COMPONENT;
    

   --Inputs
   signal ASel0 : std_logic := '0';
   signal ASel1 : std_logic := '0';
   signal ASel2 : std_logic := '0';
   signal Asel3 : std_logic := '0';
   signal Bsel0 : std_logic := '0';
   signal BSel1 : std_logic := '0';
   signal BSel2 : std_logic := '0';
   signal Bsel3 : std_logic := '0';
   signal LoadEnable : std_logic := '0';
   signal MBSelect : std_logic := '0';
   signal MDSelect : std_logic := '0';
   signal MFSelect : std_logic := '0';
   signal MMSelect : std_logic := '0';
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal zeroFill : std_logic_vector(15 downto 0) := (others => '0');
   signal sg0 : std_logic := '0';
   signal sg1 : std_logic := '0';
   signal sg2 : std_logic := '0';
   signal sh0 : std_logic := '0';
   signal sh1 : std_logic := '0';
   signal cin : std_logic := '0';
   signal d0 : std_logic := '0';
   signal d1 : std_logic := '0';
   signal d2 : std_logic := '0';
   signal d3 : std_logic := '0';
   signal MW : std_logic := '0';
   signal CLK : std_logic := '0';
   signal dataIn : std_logic_vector(15 downto 0) := (others => '0');
   signal muxMOut : std_logic_vector(15 downto 0) := (others => '0');
   signal PC : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal dataOut : std_logic_vector(15 downto 0);
   signal addressOut : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Datapath PORT MAP (
          ASel0 => ASel0,
          ASel1 => ASel1,
          ASel2 => ASel2,
          Asel3 => Asel3,
          Bsel0 => Bsel0,
          BSel1 => BSel1,
          BSel2 => BSel2,
          Bsel3 => Bsel3,
          LoadEnable => LoadEnable,
          MBSelect => MBSelect,
          MDSelect => MDSelect,
          MFSelect => MFSelect,
          MMSelect => MMSelect,
          A => A,
          sg0 => sg0,
          sg1 => sg1,
          sg2 => sg2,
          sh0 => sh0,
          sh1 => sh1,
          cin => cin,
          d0 => d0,
          d1 => d1,
          d2 => d2,
          d3 => d3,
          MW => MW,
          CLK => CLK,
          dataIn => dataIn,
			 zeroFill => zeroFill,
          PC => PC,
          dataOut => dataOut,
          addressOut => addressOut,
			 muxMOut => muxMOut);

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
		loadEnable <= '1';
		-- A MUX SELECT
		ASel0 <= '0';
		ASel1 <= '0';
		ASel2 <= '0';
		ASel3 <= '0';
		-- MUX B SELECT
		BSel0 <= '0';
		BSel1 <= '0';
		BSel2 <= '0';
		BSel3 <= '0';
		
		-- TB and TD
		sg0 <= '0';
		sg1 <= '0';
		sg2 <= '0';
		sh0 <= '0';
		sh1 <= '0';
		
		d0 <= '0';
		d1 <= '0';
		d2 <= '0';
		d3 <= '0';
		
		MW <= '0';
		
		dataIn <= "0000000000000011";
		PC <= "0000000000000001";
		A <= "0000000000000010";
		
		LoadEnable <= '1';
      MBSelect <= '1';
      MDSelect <= '1';
      MFSelect <= '1';
      MMSelect <= '0';
		
      wait for CLK_period*10;
		wait;
   end process;

END;
