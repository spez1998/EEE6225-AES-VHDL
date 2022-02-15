-- Hardware S-Box implementation for AES-128
-- Input: one byte
-- Output: one byte
-- Delay: one clock cycle

library IEEE;
use IEEE.std_logic_1164.all;

entity top is
    port(inByte: in std_logic_vector(7 downto 0);
         outByte: out std_logic_vector(7 downto 0);
         enc_dec: in std_logic); -- 0 for encode, 1 for decode
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

    signal isoIn:  std_logic_vector(7 downto 0);
    signal invIsoOut: std_logic_vector(7 downto 0);
    signal multIn:  std_logic_vector(7 downto 0);
    signal multOut: std_logic_vector(7 downto 0);
    signal decInvAffine: std_logic_vector(7 downto 0);
    signal invAffineOut: std_logic_vector(7 downto 0);
    signal encAffine:    std_logic_vector(7 downto 0);
    signal affineOut:    std_logic_vector(7 downto 0);

    begin
        
        process(inByte, enc_dec) begin
            if(enc_dec = '0') then
                isoIn  <= inByte;
                outByte <= AffineOut;
            else
                isoIn  <= invAffineOut;
                outByte <= invIsoOut;
            end if;
        end process;

        inverseAffine1: inverseAffine port map(inByte => inByte, outByte => invAffineOut);
        affine1: affine port map(inByte => invIsoOut, outByte => affineOut);
        iso1: iso port map(inByte => isoIn, outByte => multIn);
        inverseIso1: inverseIso port map(inByte => multOut, outByte => invIsoOut);
        multInv1: multInv port map(inByte => multIn, outByte => multOut);

end arch;