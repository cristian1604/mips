----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Bottazzi, Cristian
-- 
-- Create Date:    18:34:29 11/19/2017 
-- Design Name: 
-- Module Name:    Mux3a1 - Behavioral 
-- Project Name: Single Cycle MIPS Proceesor
--
----------------------------------------------------------------------------------
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

entity Mux3a1 is
    Port ( selectIn : in  STD_LOGIC_VECTOR (1 downto 0);
           fullUart : in  STD_LOGIC;
           emptyUart : in  STD_LOGIC;
           datoUart : in  STD_LOGIC_VECTOR (7 downto 0);
           datoOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux3a1;

architecture Behavioral of Mux3a1 is

begin
			with selectIn select datoOut <=
				(x"000000" & datoUart) when "01",
				(x"0000000" & "000" & EmptyUart) when "10",
				(x"0000000" & "000" & fullUart) when "11",
				x"00000000" when others;

end Behavioral;

