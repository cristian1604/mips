library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
-- Bottazzi, Cristian - 2017 (https://github.com/cristian1604/)

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           func : in  STD_LOGIC_VECTOR (2 downto 0);
			  zero: out std_logic ;
           rslt : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is
	COMPONENT zero_extend
	PORT(
		inic : IN std_logic;          
		extend : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Mux_2to1_32b
	PORT(
		ctrl : IN std_logic;
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		O : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT alu_sum_res
	PORT(
		ctrl : IN std_logic;
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);          
		sol : OUT std_logic_vector(31 downto 0);
		cout : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT mux_4_32b
	PORT(
		ctrl : IN std_logic_vector(1 downto 0);
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		c : IN std_logic_vector(31 downto 0);
		d : IN std_logic_vector(31 downto 0);          
		sal : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
	signal	rslt_and,rslt_or,rslt_and_compl,rslt_mux_alu,
					rslt_or_compl,rslt_slt,bb,b_compl,rslt_sum_res : std_logic_vector (31 downto 0):=x"00000000";
	
begin
	
	b_compl<=not(b);
	
	mux_b_b_compl: Mux_2to1_32b PORT MAP(
		ctrl => func(2),
		A => b,
		B => b_compl,
		O => bb
	);
	
	Inst_alu_sum_res: alu_sum_res PORT MAP(
		ctrl => func(2),
		a => a,
		b => bb,
		sol => rslt_sum_res
	);
	
	rslt_and<=a and bb;
	rslt_or<=a or bb;
	
	Inst_zero_extend: zero_extend PORT MAP(
		inic => rslt_sum_res(31),
		extend => rslt_slt
	);
	
	mux_rslt_alu: mux_4_32b PORT MAP(
		ctrl => func(1 downto 0),
		a => rslt_and,
		b => rslt_or,
		c => rslt_sum_res,
		d => rslt_slt,
		sal => rslt_mux_alu
	);
	
	
	zero<=	'1' when (rslt_mux_alu=x"00000000") else 
				'0';
	rslt<=rslt_mux_alu;
	
	
	
			
end Behavioral;

