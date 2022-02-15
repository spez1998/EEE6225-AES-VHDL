library IEEE;
use IEEE.std_logic_1164.all;

entity squarer is
        port(inNib  : in std_logic_vector (3 downto 0);
             outNib : out std_logic_vector (3 downto 0));
end squarer;

architecture struct of squarer is
    begin
        outNib(0) <= inNib(0);
        outNib(1) <= inNib(0) xor inNib(1);
        outNib(2) <= inNib(1) xor inNib(2);
        outNib(3) <= (inNib(2) xor inNib(3)) xor inNib(0);
end struct;