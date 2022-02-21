-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: gf2mult.vhd
-- Entity name: gf2mult
-- Description: Multiply two elements of GF(2^2) in that field

library IEEE;
use IEEE.std_logic_1164.all;

entity gf2mult is
        port(inNib  : in std_logic_vector (3 downto 0);   -- Two 2-bit multiplicands
             outNib : out std_logic_vector (1 downto 0)); -- 2-bit multiplication result
end gf2mult;

architecture struct of gf2mult is
    begin
        outNib(1) <= ((inNib(3) xor inNib(2)) and (inNib(1) xor inNib(0))) xor (inNib(2) and inNib(0));
        outNib(0) <= (inNib(3) and inNib(1)) xor (inNib(2) and inNib(0));
end struct;