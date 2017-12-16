library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_sum_res is
    Port ( ctrl : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           sol : out  STD_LOGIC_VECTOR (31 downto 0);
           cout : out  STD_LOGIC);
end alu_sum_res;

architecture Behavioral of alu_sum_res is

signal result : std_logic_vector(32 downto 0);
begin
	
	result<=("0" & a) + ("0" & b) + ctrl;
	sol<=result(31 downto 0);
	cout<=result(32);

end Behavioral;

