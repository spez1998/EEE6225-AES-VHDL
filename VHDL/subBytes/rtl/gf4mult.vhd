-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: gf4mult.vhd
-- Entity name: gf4mult
-- Description: Multiply two elements of GF(2^4) in that field

library IEEE;
use IEEE.std_logic_1164.all;

entity gf4mult is
        port(inByte  : in std_logic_vector (7 downto 0);   -- Two 4-bit multiplicands
             outByte : out std_logic_vector (3 downto 0)); -- 4-bit multiplication result
end gf4mult;


-- Connections between 3 gf2mults and phi constant transform
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
        gf2mult2_in(3 downto 2) <= inByte(7 downto 6) xor inByte(5 downto 4);
        gf2mult2_in(1 downto 0) <= inByte(3 downto 2) xor inByte(1 downto 0);
        gf2mult1: gf2mult port map(inNib(3 downto 2) => inByte(7 downto 6),
                                   inNib(1 downto 0) => inByte(3 downto 2),
                                   outNib => gf2mult1_out);
        gf2mult2: gf2mult port map(inNib => gf2mult2_in,
                                   outNib => gf2mult2_out);
        gf2mult3: gf2mult port map(inNib(3 downto 2) => inByte(5 downto 4),
                                  inNib(1 downto 0) => inByte(1 downto 0),
                                  outNib => gf2mult3_out);
                                   
        phi1: phi port map(inQ => gf2mult1_out,
                           outQ => phi_out);

        outByte(3 downto 2) <= gf2mult2_out xor gf2mult3_out;
        outByte(1 downto 0) <= phi_out xor gf2mult3_out;
    
end struct;