library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.finish;

entity subbytes_tb is
end subbytes_tb;

architecture sim of subbytes_tb is
	component top
    	port(
        	inByte: in std_logic_vector(7 downto 0);
            outByte: out std_logic_vector(7 downto 0)
    	);
	end component;

    signal inByte, outByte: std_logic_vector(7 downto 0);

	begin

    	dut: pthru port map(inByte => inByte, outByte => outByte);

        PROC_SEQUENCE: process
        begin

            for j in 0 to 2**inByte'length - 1 loop
                inByte <= std_logic_vector(to_unsigned(j, inByte'length));
                wait for 10 ns;
            end loop;
            report "Test: OK";
            finish;

        end process;

end sim;