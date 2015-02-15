-- @Simon Markham
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registerFile is
	port( Ainput0, Ainput1, Ainput2, Ainput3 : in STD_LOGIC;
			Binput0, Binput1, Binput2, Binput3 : in STD_LOGIC;
			d1, d2, d3, d4 : in STD_LOGIC;
			CLK : in STD_LOGIC;
			load : in STD_LOGIC;
			R1, R2, R3, R4, R5, R6, R7, R8, R9 : out STD_LOGIC_VECTOR(15 downto 0);
			A, B : out STD_LOGIC_VECTOR(15 downto 0);
			dataIn : in STD_LOGIC_VECTOR(15 downto 0));
end registerFile;

-- Behaviour of how the Register File should operate.
architecture Behavioral of RegisterFile is

-- A register
	COMPONENT theRegister
		port(load : in STD_LOGIC;
			  CLK : in STD_LOGIC;
			  D : in STD_LOGIC_VECTOR(15 downto 0);
			  Q : out STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	
	-- 3 to 8 Decoder
	COMPONENT decoder
		port( a2, a1, a0, a3 : in STD_LOGIC;
				Q0, Q1, Q2, Q3 : out STD_LOGIC;
				Q4, Q5, Q6, Q7,Q8 : out STD_LOGIC );
	END COMPONENT;
	
	-- 3 to 8 Multiplexer
	COMPONENT mux1
		port( sel0, sel1, sel2, sel3 : in STD_LOGIC;
				reg1, reg2, reg3, reg4 : in STD_LOGIC_VECTOR(15 downto 0);
				reg5, reg6, reg7, reg8, reg9 : in STD_LOGIC_VECTOR(15 downto 0);
				z : out STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	
	-- 1 to 2 line Multiplexer
	COMPONENT mux2
		port( s : in STD_LOGIC;
				data1, data2 : in STD_LOGIC_VECTOR(15 downto 0);
				z : out STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;

signal 	loadReg1, loadReg2, loadReg3, loadReg4,
			loadReg5, loadReg6, loadReg7, loadReg8,
			loadReg9: STD_LOGIC;
signal 	reg0Out, reg1Out, reg2Out, reg3Out,
			reg4Out, reg5Out, reg6Out, reg7Out,
			reg8Out,
			mux1_2Data, mux1_2DataSource : STD_LOGIC_VECTOR(15 downto 0);
signal 	Aout, Bout : STD_LOGIC_VECTOR(15 downto 0);
signal 	LoadAND0, LoadAND1, LoadAND2, LoadAND3,
			LoadAND4, LoadAND5, LoadAND6, LoadAND7,
			LoadAND8 : STD_LOGIC;
begin
	LoadAND0 <= loadReg1 AND load;
	LoadAND1 <= loadReg2 AND load;
	LoadAND2 <= loadReg3 AND load;
	LoadAND3 <= loadReg4 AND load;
	LoadAND4 <= loadReg5 AND load;
	LoadAND5 <= loadReg6 AND load;
	LoadAND6 <= loadReg7 AND load;
	LoadAND7 <= loadReg8 AND load;
	LoadAND8 <= loadReg9 AND load;
	--Port mapping! :D
	reg0 : theRegister PORT MAP(
			load => loadAND0,
			clk => CLK,
			D => dataIn,
			Q => reg0Out);
	reg1 : theRegister PORT MAP(
			load => LoadAND1,
			clk => CLK,
			D => dataIn,
			Q => reg1Out);
	reg2 : theRegister PORT MAP(
			load => LoadAND2,
			clk => CLK,
			D => dataIn,
			Q => reg2Out);
	reg3 : theRegister PORT MAP(
			load => LoadAND3,
			clk => CLK,
			D => dataIn,
			Q => reg3Out);
	reg4 : theRegister PORT MAP(
			load => LoadAND4,
			clk => CLK,
			D => dataIn,
			Q => reg4Out);
	reg5 : theRegister PORT MAP(
			load => LoadAND5,
			clk => CLK,
			D => dataIn,
			Q => reg5Out);
	reg6 : theRegister PORT MAP(
			load => loadAND6,
			clk => CLK,
			D => dataIn,
			Q => reg6Out);
	reg7 : theRegister PORT MAP(
			load => LoadAND7,
			clk => CLK,
			D => dataIn,
			Q => reg7Out);
	reg8 : theRegister PORT MAP(
			load => LoadAND8,
			clk => CLK,
			D => dataIn,
			Q => reg8Out);
----------------------------------------
	theDecoder : decoder PORT MAP(
			a0 => d1,
			a1 => d2,
			a2 => d3,
			a3 => d4,
			Q0 => loadReg1,
			Q1 => loadReg2,
			Q2 => loadReg3,
			Q3 => loadReg4,
			Q4 => loadReg5,
			Q5 => loadReg6,
			Q6 => loadReg7,
			Q7 => loadReg8,
			Q8 => loadReg9);
-----------------------------------------			
	mux3_8_A : mux1 PORT MAP(
			sel0 => Ainput0,
			sel1 => Ainput1,
			sel2 => Ainput2,
			sel3 => Ainput3,
			reg1 => reg0Out,
			reg2 => reg1Out,
			reg3 => reg2Out,
			reg4 => reg3Out,
			reg5 => reg4Out,
			reg6 => reg5Out,
			reg7 => reg6Out,
			reg8 => reg7Out,
			reg9 => reg8Out,
			z => Aout);
	A <= Aout;
-----------------------------------------			
	mux3_8_B : mux1 PORT MAP(
			sel0 => Binput0,
			sel1 => Binput1,
			sel2 => Binput2,
			sel3 => Binput3,
			reg1 => reg0Out,
			reg2 => reg1Out,
			reg3 => reg2Out,
			reg4 => reg3Out,
			reg5 => reg4Out,
			reg6 => reg5Out,
			reg7 => reg6Out,
			reg8 => reg7Out,
			reg9 => reg8Out,
			z => Bout);
	B <= Bout;
-----------------------------------------
R1 <= reg0Out;
R2 <= reg1Out;
R3 <= reg2Out;
R4 <= reg3Out;
R5 <= reg4Out;
R6 <= reg5Out;
R7 <= reg6Out;
R8 <= reg7Out;
R9 <= reg8Out;
end Behavioral;