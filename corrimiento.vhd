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

entity corrimiento is
    Port ( din : in  STD_LOGIC_VECTOR (31 downto 0);
           dout : out  STD_LOGIC_VECTOR (31 downto 0));
end corrimiento;

architecture Behavioral of corrimiento is

begin
	dout<=din(29 downto 0)&"00"; --es una multiplicacion por 4
end Behavioral;

