library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Bottazzi, Cristian - 2017 (https://github.com/cristian1604/)

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_suma is
    Port ( 
				a : in  STD_LOGIC_VECTOR (31 downto 0);
				b : in  STD_LOGIC_VECTOR (31 downto 0);
				sal : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU_suma;

architecture Behavioral of ALU_suma is

begin
	
	sal<=a+b;
	
end Behavioral;

