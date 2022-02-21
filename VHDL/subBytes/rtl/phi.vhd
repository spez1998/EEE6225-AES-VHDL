-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: phi.vhd
-- Entity name: phi
-- Description: Multiply element of GF(2^2) with a constant phi

library IEEE;
use IEEE.std_logic_1164.all;

entity phi is
        port(inQ  : in std_logic_vector (1 downto 0);   -- 2-bit GF(2^2) input
             outQ : out std_logic_vector (1 downto 0)); -- Transformed GF(2^2) output
end phi;

architecture struct of phi is
    begin
        outQ(1) <= inQ(1) xor inQ(0);
        outQ(0) <= inQ(1);
end struct;