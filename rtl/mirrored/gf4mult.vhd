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
    
    signal gf2mult2_in : std_logic_vector(3 downto 0);

    signal gf2mult1_out : std_logic_vector(1 downto 0);
    signal gf2mult2_out : std_logic_vector(1 downto 0);
    signal gf2mult3_out : std_logic_vector(1 downto 0);

    signal phi_out : std_logic_vector(1 downto 0);

    begin
        gf2mult2_in(1 downto 0) <= inByte(1 downto 0) xor inByte(3 downto 2);
        gf2mult2_in(3 downto 2) <= inByte(5 downto 4) xor inByte(7 downto 6);
        gf2mult1: gf2mult port map(inNib(1 downto 0) => inByte(1 downto 0),
                                   inNib(3 downto 2) => inByte(5 downto 4),
                                   outNib => gf2mult1_out);
        gf2mult2: gf2mult port map(inNib => gf2mult2_in,
                                   outNib => gf2mult2_out);
        gf2mult3: gf2mult port map(inNib(1 downto 0) => inByte(3 downto 2),
                                  inNib(3 downto 2) => inByte(7 downto 6),
                                  outNib => gf2mult3_out);
                                   
        phi1: phi port map(inQ => gf2mult1_out,
                           outQ => phi_out);

        outByte(1 downto 0) <= gf2mult2_out xor gf2mult3_out;
        outByte(3 downto 2) <= phi_out xor gf2mult3_out;
    
end struct;