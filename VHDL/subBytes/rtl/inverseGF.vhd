-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: inverseGF.vhd
-- Entity name: inverseGF
-- Description: Invert element of GF(2^4)

library IEEE;
use IEEE.std_logic_1164.all;

entity inverseGF is
    port(xIn  : in std_logic_vector (3 downto 0);   -- GF(2^4) element to invert
         xOut : out std_logic_vector (3 downto 0)); -- Inverted GF(2^4) element
end inverseGF;

architecture behav of inverseGF is
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