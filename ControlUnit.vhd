library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Bottazzi, Cristian - 2017 (https://github.com/cristian1604/)

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlUnit is
    Port ( OpCode : in  STD_LOGIC_VECTOR (5 downto 0);
           Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           MemtoReg : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           AluSrc : out  STD_LOGIC;
           RegDst : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
			  jump : out std_logic;
           AluCtrl : out  STD_LOGIC_VECTOR (2 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is
	COMPONENT MainDecoder
	PORT(
		opcode : IN std_logic_vector(5 downto 0);          
		RegWrite : OUT std_logic;
		RegDst : OUT std_logic;
		ALUSrc : OUT std_logic;
		Branch : OUT std_logic;
		MemWrite : OUT std_logic;
		MemtoReg : OUT std_logic;
		ALUOp : OUT std_logic_vector(1 downto 0);
		Jump : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT ALUdecoder
	PORT(
		ALUop : IN std_logic_vector(1 downto 0);
		funct : IN std_logic_vector(5 downto 0);          
		ALUctrl : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	signal opalu:std_logic_vector(1 downto 0);

begin

Inst_MainDecoder: MainDecoder PORT MAP(
		opcode => opcode,
		RegWrite => regwrite,
		RegDst => regdst,
		ALUSrc => alusrc ,
		Branch => branch,
		MemWrite => memwrite,
		MemtoReg => memtoreg,
		ALUOp => opalu,
		Jump => jump
	);

Inst_ALUdecoder: ALUdecoder PORT MAP(
		ALUop => opalu,
		funct => funct,
		ALUctrl => aluctrl
	);
	
end Behavioral;

