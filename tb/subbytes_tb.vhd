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
            enc_dec: in std_logic
    	);
	end component;

    file testVectors: text;
    file testResults: text;

    signal inByte, outByte: std_logic_vector(7 downto 0);
    signal enc_dec: std_logic := '0';

	begin

    	dut: top port map(inByte => inByte, outByte => outByte, enc_dec => enc_dec);

        PROC_DRIVER: process
        begin
            
            for j in 0 to 2**inByte'length - 1 loop
                inByte <= std_logic_vector(to_unsigned(j, inByte'length));
                wait for 10 ns;
            end loop;
            report "Test: OK";
            finish;
        end process;

        PROC_CHECKER : process
        variable prev : std_logic_vector(outByte'range);
        variable count : integer;
            begin
            wait on outByte;
            
            prev := outByte;
            
            -- Wait for all delta cycles to propagate
            wait for 1 ns;
            
            -- TODO: 
            -- - Read from sBox reference file
            -- - Compare output to current number's sBox value
            -- - Collect errors 
            
            assert count = 1
                report integer'image(count) & " bits changed, should have been 1"
                severity failure;
            
            end process;

end sim;