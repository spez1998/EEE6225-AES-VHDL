library IEEE;
use IEEE.std_logic_1164.all;

entity iso is
    port(inByte  : in std_logic_vector(7 downto 0),
         outByte : out std_logic_vector(7 downto 0));
end iso;

architecture behav of iso is
    begin
        outByte(7) <= inByte(7) + inByte(5);
        outByte(6) <= inByte(7) + inByte(6) + inByte(4) +
                      inByte(3) + inByte(2) + inByte(1);
        outByte(5) <= inByte(7) + inByte(5) + inByte(3) + inByte(2);
        outByte(4) <= inByte(7) + inByte(5) + inByte(3) + inByte(2) + inByte(1);
        outByte(3) <= inByte(7) + inByte(6) + inByte(2) + inByte(1);
        outByte(2) <= inByte(7) + inByte(4) + inByte(3) + inByte(2) + inByte(1);
        outByte(1) <= inByte(6) + inByte(4) + inByte(1);
        outByte(0) <= inByte(6) + inByte(1) + inByte(0);
    end behav;