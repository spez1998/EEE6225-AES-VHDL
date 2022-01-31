-- Hardware S-Box implementation for AES-128
-- Input: one byte
-- Output: one byte
-- Delay: one clock cycle

library IEEE;
use IEEE.std_logic_1164.all;

entity top is
    port(inByte:  std_logic_vector(7 downto 0),
         outByte: std_logic_vector(7 downto 0),
         enc_dec: std_logic);
end entity;

architecture arch of top is
    component multInv
        port(inByte  : in std_logic_vector (7 downto 0);
             outByte : out std_logic_vector (7 downto 0));
    end component;

    component rawToGF_Forward
        port(inByte  : in std_logic_vector(7 downto 0);
             outByte : out std_logic_vector(7 downto 0));
    end component;

    component GFtoRaw_Forward
        port(inByte  : in std_logic_vector(7 downto 0);
             outByte : out std_logic_vector(7 downto 0));
    end component;

    component rawToGF_Backward
    port(inByte  : in std_logic_vector(7 downto 0);
         outByte : out std_logic_vector(7 downto 0));
    end component;

    component GFtoRaw_Backward
        port(inByte  : in std_logic_vector(7 downto 0);
            outByte : out std_logic_vector(7 downto 0));
    end component;