-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: squarer.vhd
-- Entity name: squarer
-- Description: Square an element of GF(2^4) in that field

library IEEE;
use IEEE.std_logic_1164.all;

entity squarer is
        port(inNib  : in std_logic_vector (3 downto 0);   -- GF(2^4) element in
             outNib : out std_logic_vector (3 downto 0)); -- GF(2^4) element squared out
end squarer;

architecture struct of squarer is
    begin
        outNib(3) <= inNib(3);
        outNib(2) <= inNib(3) xor inNib(2);
        outNib(1) <= inNib(2) xor inNib(1);
        outNib(0) <= inNib(3) xor inNib(1) xor inNib(0);
end struct;