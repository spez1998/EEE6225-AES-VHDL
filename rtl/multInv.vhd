library IEEE;
use IEEE.std_logic_1164.all;

entity multInv is
        port(inByte  : in std_logic_vector (7 downto 0);
             outByte : out std_logic_vector (7 downto 0));
end multInv;

architecture struct of multInv is
    component gf4mult
        port(inByte  : in std_logic_vector (7 downto 0);
             outByte : out std_logic_vector (3 downto 0));
    end component;

    component squarer
        port(inNib  : in std_logic_vector (3 downto 0);
             outNib : out std_logic_vector (3 downto 0));
    end component;

    component lambda
        port(inQ  : in std_logic_vector (3 downto 0);
             outQ : out std_logic_vector (3 downto 0));
    end component;

    component inverseGF
        port(xIn  : in std_logic_vector (3 downto 0);
             xOut : out std_logic_vector (3 downto 0));
    end component;

    begin
    end struct;