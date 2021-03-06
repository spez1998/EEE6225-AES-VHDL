-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: inverseAffine.vhd
-- Entity name: inverseAffine
-- Description: Perform Rijndael subBytes inverse affine transform on GF(2^8) element

library IEEE;
use IEEE.std_logic_1164.all;

entity inverseAffine is
    port(inByte: in std_logic_vector(7 downto 0);    -- Input byte to transform
         outByte: out std_logic_vector(7 downto 0)); -- Transformed output
end inverseAffine;

-- Constant 00000101 taken from Rijndael AES specification
architecture behav of inverseAffine is
    begin
        outByte(7) <= inByte(6) xor inByte(4) xor inByte(1) xor '0';
        outByte(6) <= inByte(5) xor inByte(3) xor inByte(0) xor '0';
        outByte(5) <= inByte(7) xor inByte(4) xor inByte(2) xor '0';
        outByte(4) <= inByte(6) xor inByte(3) xor inByte(1) xor '0';
        outByte(3) <= inByte(5) xor inByte(2) xor inByte(0) xor '0';
        outByte(2) <= inByte(7) xor inByte(4) xor inByte(1) xor '1';
        outByte(1) <= inByte(6) xor inByte(3) xor inByte(0) xor '0';
        outByte(0) <= inByte(7) xor inByte(5) xor inByte(2) xor '1';
end behav;