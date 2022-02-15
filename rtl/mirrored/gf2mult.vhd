library IEEE;
use IEEE.std_logic_1164.all;

entity gf2mult is
        port(inNib  : in std_logic_vector (3 downto 0);
             outNib : out std_logic_vector (1 downto 0));
end gf2mult;

architecture struct of gf2mult is
    begin
        outNib(0) <= ((inNib(0) xor inNib(1)) and (inNib(2) xor inNib(3))) xor (inNib(1) and inNib(3));
        outNib(1) <= (inNib(0) and inNib(2)) xor (inNib(1) and inNib(3));
end struct;