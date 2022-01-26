library IEEE;
use IEEE.std_logic_1164.all;

entity lambda is
        port(inQ  : in std_logic_vector (3 downto 0);
             outQ : out std_logic_vector (3 downto 0));
end lambda;

architecture struct of lambda is
    begin
        outQ(3) <= inQ(2) xor inQ(0);
        outQ(2) <= (inQ(3) xor inQ(1)) xor (inQ(2) xor inQ(0));
        outQ(1) <= inQ(3);
        outQ(0) <= inQ(2);
end struct;