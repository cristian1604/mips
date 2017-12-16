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

entity SignExtend is
    Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
           dout : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExtend;

architecture Behavioral of SignExtend is
	--signal a : std_logic;
begin
dout<= x"0000"&din when (din(15)='0') else  x"ffff"&din;
		
		
		
	
end Behavioral;

