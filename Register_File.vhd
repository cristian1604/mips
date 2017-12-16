library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Bottazzi, Cristian - 2017 (https://github.com/cristian1604/)

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_File is
    Port ( clk : in  STD_LOGIC;
           we3 : in  STD_LOGIC;
           A1 : in  STD_LOGIC_VECTOR (4 downto 0);
           A2 : in  STD_LOGIC_VECTOR (4 downto 0);
           A3 : in  STD_LOGIC_VECTOR (4 downto 0);
           RD1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RD2 : out  STD_LOGIC_VECTOR (31 downto 0);
           WD3 : in  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Behavioral of Register_File is

type ram_type is array(0 to 31) of std_logic_vector(31 downto 0);
signal ram : ram_type;
begin
	
	process(clk)
	begin
		if(clk'event and clk='1') then
				if (we3='1') then
					ram(conv_integer(A3))<=WD3;
				end if;
		end if;
	end process;
	
	process(a1,a2)
	begin
		if( conv_integer(A1)=0) then rd1<=x"00000000";
		else RD1<=ram(conv_integer(A1));
		end if;
		if(conv_integer(A2)=0) then rd2<=x"00000000";
		else RD2<=ram(conv_integer(A2));
		end if;
	end process;
	
end Behavioral;

