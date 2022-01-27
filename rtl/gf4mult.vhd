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
    
    signal gf2mult2_b3 : std_logic;
    signal gf2mult2_b2 : std_logic;
    signal gf2mult2_b1 : std_logic;
    signal gf2mult2_b0 : std_logic;

    signal gf2mult1_out : std_logic_vector(1 downto 0);
    signal gf2mult2_out : std_logic_vector(1 downto 0);
    signal gf2mult3_out : std_logic_vector(1 downto 0);

    signal phi_out : std_logic_vector(1 downto 0);

    begin
        gf2mult2_b3 <= inByte(7) xor inByte(5);
        gf2mult2_b2 <= inByte(6) xor inByte(4);
        gf2mult2_b1 <= inByte(3) xor inByte(1);
        gf2mult2_b0 <= inByte(2) xor inByte(0);
        
        gf2mult1: gf2mult port map(inNib(3 downto 2) => inByte(7 downto 6),
                                   inNib(1 downto 0) => inByte(3 downto 2),
                                   outNib => gf2mult1_out);
        gf2mult2: gf2mult port map(inNib(3) => gf2mult2_b3,
                                   inNib(2) => gf2mult2_b2,
                                   inNib(1) => gf2mult2_b1,
                                   inNib(0) => gf2mult2_b0,
                                   outNib => gf2mult2_out);
        gf2mult3: gf2mult port map(inNib(3 downto 2) => inByte(5 downto 4),
                                  inNib(1 downto 0) => inByte(1 downto 0),
                                  outNib => gf2mult3_out);
                                   
        phi: phi port map(inQ => gf2mult1_out,
                          outQ => phi_out);

        outByte(3) <= gf2mult2_out(1) xor gf2mult3_out(1);
        outByte(2) <= gf2mult2_out(0) xor gf2mult3_out(0);
        outByte(1) <= phi_out(1) xor gf2mult3_out(1);
        outByte(0) <= phi_out(0) xor gf2mult3_out(0);
    
    end struct;