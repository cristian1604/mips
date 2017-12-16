library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- Bottazzi, Ferrer
--use IEEE.NUMERIC_STD.ALL;
-- Bottazzi, Cristian - 2017 (https://github.com/cristian1604/)

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_2to1_32b is
    Port ( ctrl : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux_2to1_32b;

architecture Behavioral of Mux_2to1_32b is

begin
	o <= 	a 	when ctrl='0' else b;
			
end Behavioral;

