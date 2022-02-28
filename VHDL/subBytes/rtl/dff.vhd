-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: dff.vhd
-- Entity name: dff
-- Description: Infer rising-edge asynchronous reset D-type byte flip-flop

library IEEE;
use IEEE.std_logic_1164.all;

entity dff is
    port(clk : in std_logic;
         rst : in std_logic;
         d   : in std_logic_vector(7 downto 0);
         q   : out std_logic_vector(7 downto 0));
end entity;

architecture inf of dff is
    begin
        process(clk, rst) begin
            if(rst == '1') then
                q <= (others => '0');
            elsif(rising_edge(clk)) then
                q <= d;
            end if;
        end process;
end inf;