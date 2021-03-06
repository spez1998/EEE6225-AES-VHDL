-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: inverseIso.vhd
-- Entity name: inverseIso
-- Description: Map element of GF(2^4) to GF(2^8)

library IEEE;
use IEEE.std_logic_1164.all;

entity inverseIso is
    port(inByte: in std_logic_vector(7 downto 0);    -- GF(2^4) element
         outByte: out std_logic_vector(7 downto 0)); -- GF(2^8) element
end inverseIso;

architecture behav of inverseIso is
    begin
        outByte(0) <= inByte(0) xor inByte(2) xor inByte(4) xor inByte(5) xor inByte(6);
        outByte(1) <= inByte(4) xor inByte(5);
        outByte(2) <= inByte(1) xor inByte(2) xor inByte(3) xor inByte(4) xor inByte(7);
        outByte(3) <= inByte(1) xor inByte(2) xor inByte(3) xor inByte(4) xor inByte(5);
        outByte(4) <= inByte(1) xor inByte(2) xor inByte(4) xor inByte(5) xor inByte(6);
        outByte(5) <= inByte(1) xor inByte(5) xor inByte(6);
        outByte(6) <= inByte(2) xor inByte(6);
        outByte(7) <= inByte(1) xor inByte(5) xor inByte(6) xor inByte(7);
end behav;