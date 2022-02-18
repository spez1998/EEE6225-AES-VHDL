LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity gfInv_tb is
end gfInv_tb;

architecture behav of gfInv_tb is

    component gfInv
    port(xIn  : in std_logic_vector (3 downto 0);
         xOut : out std_logic_vector (3 downto 0));

    end component;

    signal xIn  : std_logic_vector(3 downto 0) := (others => '0');
    signal xOut : std_logic_vector(3 downto 0) := (others => '0');

begin
    dut: gfInv port map (xIn  => xIn,
                         xOut => xOut);

    xIn <= "1011";
end;