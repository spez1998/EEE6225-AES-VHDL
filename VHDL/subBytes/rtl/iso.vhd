-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: iso.vhd
-- Entity name: iso
-- Description: Map element of GF(2^8) to GF(2^4) composite field

library IEEE;
use IEEE.std_logic_1164.all;

entity iso is
    port(inByte  : in std_logic_vector(7 downto 0);   -- GF(2^8) element
         outByte : out std_logic_vector(7 downto 0)); -- GF(2^4) element
end iso;

architecture behav of iso is
    begin
        outByte(7) <= inByte(7) xor inByte(5);
        outByte(6) <= inByte(7) xor inByte(6) xor inByte(4) xor inByte(3) xor inByte(2) xor inByte(1);
        outByte(5) <= inByte(7) xor inByte(5) xor inByte(3) xor inByte(2);
        outByte(4) <= inByte(7) xor inByte(5) xor inByte(3) xor inByte(2) xor inByte(1);
        outByte(3) <= inByte(7) xor inByte(6) xor inByte(2) xor inByte(1);
        outByte(2) <= inByte(7) xor inByte(4) xor inByte(3) xor inByte(2) xor inByte(1);
        outByte(1) <= inByte(6) xor inByte(4) xor inByte(1);
        outByte(0) <= inByte(6) xor inByte(1) xor inByte(0);
end behav;