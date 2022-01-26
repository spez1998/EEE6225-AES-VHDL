library IEEE;
use IEEE.std_logic_1164.all;

entity gf4mult is
        port(inByte  : in std_logic_vector (7 downto 0);
             outByte : out std_logic_vector (3 downto 0));
end gf4mult;

architecture struct of gf4mult is
    component gf2mult
        port(inNib  : in std_logic_vector (3 downto 0);
             outNib : out std_logic_vector (1 downto 0));
    end component;

    component phi
        port(inQ  : in std_logic_vector (1 downto 0);
             outQ : out std_logic_vector (1 downto 0));
    end component;
    
    begin
        gf2mult1: gf2mult port map(inNib(3 downto 2) => inByte(7 downto 6),
                                   inNib(1 downto 0) => inByte(3 downto 2));
        gf2mult2: gf2mult port map(inNib(3) => (inByte(7) xor inByte(5)),
                                   inNib(2) => (inByte(6) xor inByte(4)),
                                   inNib(1) => (inByte(3) xor inByte(1)),
                                   inNib(0) => (inByte(2) xor inByte(0)));
        gfmult3: gf2mult port map(inNib(3 downto 2) => inByte(5 downto 4),
                                  inNib(1 downto 0) => inByte(1 downto 0));
                                   
        
    
    end struct;