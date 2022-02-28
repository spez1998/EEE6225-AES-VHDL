-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: top.vhd
-- Entity name: top
-- Description: Perform Rijndael subBytes transform on a byte

library IEEE;
use IEEE.std_logic_1164.all;

entity top is
    port(inByte: in std_logic_vector(7 downto 0);   -- Input byte
         outByte: out std_logic_vector(7 downto 0); -- Output byte transformed by sBox
         enc_dec: in std_logic; -- 0 for encode, 1 for decode
         clk: in std_logic; -- Clock for pipelining flip-flops
         reset: in std_logic); -- Connect to global reset line
end entity;

architecture arch of top is
    component multInv
        port(inByte  : in std_logic_vector (7 downto 0);
             outByte : out std_logic_vector (7 downto 0));
    end component;

    component affine
        port(inByte  : in std_logic_vector (7 downto 0);
             outByte : out std_logic_vector (7 downto 0));
    end component;

    component inverseAffine
        port(inByte  : in std_logic_vector (7 downto 0);
             outByte : out std_logic_vector (7 downto 0));
    end component;

    component iso
        port(inByte  : in std_logic_vector (7 downto 0);
             outByte : out std_logic_vector (7 downto 0));
    end component;

    component inverseIso
        port(inByte  : in std_logic_vector (7 downto 0);
             outByte : out std_logic_vector (7 downto 0));
    end component;

    component dff
        port(d   : in std_logic_vector(7 downto 0);
             q   : out std_logic_vector(7 downto 0);
             clk : in std_logic;
             rst : in std_logic);
    end component;

    -- Connection signals, split to allow room for flip-flops
    signal isoIn:          std_logic_vector(7 downto 0);
    signal invIsoOut_d:    std_logic_vector(7 downto 0);
    signal invIsoOut_q:    std_logic_vector(7 downto 0);
    signal multIn_d:       std_logic_vector(7 downto 0);
    signal multIn_q:       std_logic_vector(7 downto 0);
    signal multOut_d:      std_logic_vector(7 downto 0);
    signal multOut_q:      std_logic_vector(7 downto 0);
    signal decInvAffine:   std_logic_vector(7 downto 0);
    signal invAffineOut_d: std_logic_vector(7 downto 0);
    signal invAffineOut_q: std_logic_vector(7 downto 0);
    signal encAffine:      std_logic_vector(7 downto 0);
    signal affineOut_d:    std_logic_vector(7 downto 0);
    signal affineOut_q:    std_logic_vector(7 downto 0);

    begin

        -- Create all necessary connections between main sub-entities
        inverseAffine1: inverseAffine port map(inByte => inByte, outByte => invAffineOut_d);
        affine1: affine port map(inByte => invIsoOut_q, outByte => affineOut_d);
        iso1: iso port map(inByte => isoIn, outByte => multIn_d);
        inverseIso1: inverseIso port map(inByte => multOut_q, outByte => invIsoOut_d);
        multInv1: multInv port map(inByte => multIn_q, outByte => multOut_d);

        -- Flip-flops for pipelining
        dff1: dff port map(d => invAffineOut_d, q => invAffineOut_q, clk => clk, rst => rst);
        dff2: dff port map(d => multIn_d, q => multIn_q, clk => clk, rst => rst);
        dff3: dff port map(d => multOut_d, q => multOut_q, clk => clk, rst => rst);
        dff4: dff port map(d => invIsoOut_d, q => invIsoOut_q, clk => clk, rst => rst);
        dff5: dff port map(d => affineOut_d, q => affineOut_q, clk => clk, rst => rst);

        -- Infer multiplexers at input and output stage
        -- If encode, NO inverse affine before multInverse, YES affine after multInverse
        -- If decode, YES inverse affine before multInverse, NO affine after multInverse
        -- If reset, output 0x00
        isoIn <= inByte when enc_dec = '0' else 
                 invAffineOut_q;
        outByte <= (others => '0') when reset = '1' else
                    affineOut_q when enc_dec = '0' else
                    invIsoOut_q;
end arch;