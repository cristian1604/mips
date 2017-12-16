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

entity PC is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (31 downto 0);
           dout : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is
	
begin
	process(clk,reset)
	begin
		if(reset='1') then
				dout <= (others=>'0');
		elsif(clk'event and clk='1') then
			dout<=din;
		end if;
	end process;

end Behavioral;

