library IEEE;
use IEEE.std_logic_1164.all;

entity affine is
    port(inByte  : in std_logic_vector(7 downto 0),
         outByte : out std_logic_vector(7 downto 0));
end affine;

architecture behav of affine is
    begin
        outByte(7) <= inByte(7) xor inByte(6) xor inByte(5) xor inByte(4) xor 
                      inByte(3) xor 0;
        outByte(6) <= inByte(6) xor inByte(5) xor inByte(4) xor inByte(3) xor 
                      inByte(2) xor 1;
        outByte(5) <= inByte(5) xor inByte(4) xor inByte(3) xor inByte(2) xor 
                      inByte(1) xor 1;
        outByte(4) <= inByte(4) xor inByte(3) xor inByte(2) xor inByte(1) xor
                      inByte(0) xor 0;
        outByte(3) <= inByte(7) xor inByte(3) xor inByte(2) xor inByte(1) xor 
                      inByte(0) xor 0;
        outByte(2) <= inByte(7) xor inByte(6) xor inByte(2) xor inByte(1) xor
                      inByte(0) xor 0;
        outByte(1) <= inByte(7) xor inByte(6) xor inByte(5) xor inByte(1) xor
                      inByte(0) xor 1;
        outByte(0) <= inByte(7) xor inByte(6) xor inByte(5) xor inByte(4) xor
                      inByte(0) xor 1;
    end behav;