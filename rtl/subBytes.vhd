library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subBytes is
	Port (rst, clk  : in STD_LOGIC;
	      block_in  : in STD_LOGIC_VECTOR (7 downto 0);
	      block_out : out STD_LOGIC_VECTOR (7 downto 0));
end subBytes;

architecture behavioural of subBytes is

begin
	
	block_out <= block_in;

end behavioural;
