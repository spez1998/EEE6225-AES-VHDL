library IEEE;
use IEEE.std_logic_1164.all;

entity phi is
        port(inQ  : in std_logic_vector (1 downto 0);
             outQ : out std_logic_vector (1 downto 0));
end phi;

architecture struct of phi is
    begin
        outQ(1) <= inQ(1) xor inQ(0);
        outQ(0) <= inQ(1);
    end struct;