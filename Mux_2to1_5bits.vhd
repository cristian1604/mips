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

entity Mux_2to1_5bits is
    Port ( ctrl : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (4 downto 0);
           b : in  STD_LOGIC_VECTOR (4 downto 0);
           sal : out  STD_LOGIC_VECTOR (4 downto 0));
end Mux_2to1_5bits;

architecture Behavioral of Mux_2to1_5bits is

begin
	sal <= 	a 	when ctrl='0' else b;

end Behavioral;

