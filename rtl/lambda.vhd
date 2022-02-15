library IEEE;
use IEEE.std_logic_1164.all;

entity lambda is
        port(inNib  : in std_logic_vector (3 downto 0);
             outNib : out std_logic_vector (3 downto 0));
end lambda;

architecture struct of lambda is
    begin
        outNib(3) <= inNib(2) xor inNib(0);
        outNib(2) <= (inNib(3) xor inNib(1)) xor inNib(0);
        outNib(1) <= inNib(3);
        outNib(0) <= inNib(2);
end struct;