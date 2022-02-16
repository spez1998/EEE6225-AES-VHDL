-- Hardware S-Box implementation for AES-128
-- Author: Sujit Malde
-- Filename: subbytes_tb.vhd
-- Entity name: subbytes_tb
-- Description: Test hardware implementation of Rijndael subBytes

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.finish;
use std.textio.all;
use ieee.std_logic_textio.all;

entity subbytes_tb is
end subbytes_tb;

architecture sim of subbytes_tb is
	component top
    	port(
        	inByte: in std_logic_vector(7 downto 0);
            outByte: out std_logic_vector(7 downto 0);
            enc_dec: in std_logic;
            reset: in std_logic
    	);
	end component;

    file testVectors: text;
    file testResults: text;

    signal inByte, outByte: std_logic_vector(7 downto 0);
    signal enc_dec: std_logic := '0';
    signal reset: std_logic:= '0';

	begin

    	dut: top port map(inByte => inByte, outByte => outByte, enc_dec => enc_dec, reset => reset);

        PROC_DRIVER: process
        begin
            
            -- Reset test
            for j in 2 downto 0 loop
                inByte <= std_logic_vector(to_unsigned(j, inByte'length));
                wait for 10ns;
            end loop;
            
            reset <= '1';
            for j in 0 to 2 loop
                inByte <= std_logic_vector(to_unsigned(j, inByte'length));
                wait for 10ns;
            end loop;
            reset <= '0';
            -- Finished reset test
            
            -- Encrypt test 
            for j in 0 to 2**inByte'length - 1 loop
                inByte <= std_logic_vector(to_unsigned(j, inByte'length));
                wait for 10 ns;
            end loop;
            -- End encrypt test
            
            -- Decrypt test
            enc_dec <= '1';
            for j in 0 to 2**inByte'length - 1 loop
                inByte <= std_logic_vector(to_unsigned(j, inByte'length));
                wait for 10 ns;
            end loop;
            -- End decrypt test
                 
            report "All tests: OK";
            finish;
        end process;
end sim;