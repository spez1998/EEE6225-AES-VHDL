-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: multInv.vhd
-- Entity name: multInv
-- Description: Calculate multiplicative inverse of an element in GF(2^8)

library IEEE;
use IEEE.std_logic_1164.all;

entity multInv is
        port(inByte  : in std_logic_vector (7 downto 0);   -- GF(2^8) element
             outByte : out std_logic_vector (7 downto 0)); -- Inverted GF(2^8) element
end multInv;

-- Connections between gf4mult, squarer, lambda transform and inverter
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
        port(inNib  : in std_logic_vector (3 downto 0);
             outNib : out std_logic_vector (3 downto 0));
    end component;

    component inverseGF
        port(xIn  : in std_logic_vector (3 downto 0);
             xOut : out std_logic_vector (3 downto 0));
    end component;

    signal squarer_in:    std_logic_vector(3 downto 0);
    signal lambda_in:     std_logic_vector(3 downto 0);
    signal lambda_out:    std_logic_vector(3 downto 0);
    signal gf4mult1_in:   std_logic_vector(7 downto 0);
    signal gf4mult1_out:  std_logic_vector(3 downto 0);
    signal inverseGF_in:  std_logic_vector(3 downto 0);
    signal inverseGF_out: std_logic_vector(3 downto 0);
    signal gf4mult2_in:   std_logic_vector(7 downto 0);
    signal gf4mult2_out:  std_logic_vector(3 downto 0);
    signal gf4mult3_in:   std_logic_vector(7 downto 0);
    signal gf4mult3_out:  std_logic_vector(3 downto 0);

    begin
        squarer_in <= inByte(7 downto 4);
        squarer1: squarer port map(inNib => squarer_in, outNib => lambda_in);
        lambda1: lambda port map(inNib => lambda_in, outNib => lambda_out);
        
        gf4mult1_in(7) <= inByte(7) xor inByte(3);
        gf4mult1_in(6) <= inByte(6) xor inByte(2);
        gf4mult1_in(5) <= inByte(5) xor inByte(1);
        gf4mult1_in(4) <= inByte(4) xor inByte(0);
        gf4mult1_in(3 downto 0) <= inByte(3 downto 0);
        gf4mult1: gf4mult port map(inByte => gf4mult1_in,
                                   outByte => gf4mult1_out);
        
        inverseGF_in <= lambda_out xor gf4mult1_out;
        inverseGF1: inverseGF port map(xIn => inverseGF_in, xOut => inverseGF_out);

        gf4mult2_in(7 downto 4) <= squarer_in;
        gf4mult2_in(3 downto 0) <= inverseGF_out;
        gf4mult2: gf4mult port map(inByte => gf4mult2_in, outByte => gf4mult2_out);
        gf4mult3_in(7 downto 4) <= inverseGF_out;
        gf4mult3_in(3 downto 0) <= gf4mult1_in(7 downto 4);
        gf4mult3: gf4mult port map(inByte => gf4mult3_in, outByte => gf4mult3_out);

        outByte(7 downto 4) <= gf4mult2_out;
        outByte(3 downto 0) <= gf4mult3_out;

end struct;