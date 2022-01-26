library IEEE;
use IEEE.std_logic_1164.all;

entity gfInv is
    port(xIn  : in std_logic_vector (3 downto 0);
         xOut : out std_logic_vector (3 downto 0));
end gfInv;

architecture behav of gfInv is
    begin
        xOut(3) <= xIn(3) xor
                    (xIn(3) and xIn(2) and xIn(1)) xor
                    (xIn(3) and xIn(0)) xor
                    xIn(2);
        xOut(2) <= (xIn(3) and xIn(2) and xIn(1)) xor
                    (xin(3) and xIn(2) and xIn(0)) xor
                    (xIn(3) and xIn(0)) xor
                    xIn(2) xor
                    (xIn(2) and xIn(1));
        xOut(1) <= xIn(3) xor
                    (xIn(3) and xIn(2) and xIn(1)) xor
                    (xin(3) and xIn(1) and xIn(0)) xor
                    xIn(2) xor
                    (xIn(2) and xIn(0)) xor
                    xIn(1);
        xOut(0) <= (xIn(3) and xIn(2) and xIn(1)) xor
                    (xin(3) and xIn(2) and xIn(0)) xor
                    (xIn(3) and xIn(1)) xor
                    (xin(3) and xIn(1) and xIn(0)) xor
                    (xIn(3) and xIn(0)) xor
                    xIn(2) xor
                    (xIn(2) and xIn(1)) xor
                    (xin(2) and xIn(1) and xIn(0)) xor
                    xIn(1) xor
                    xIn(0);
    end behav;