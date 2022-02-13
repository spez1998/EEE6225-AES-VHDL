library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.finish;

entity subbytes_tb is
end subbytes_tb;

architecture sim of subbytes_tb is
    signal inByte  : std_logic_vector(7 downto 0) := (others => '0');
    signal outByte : std_logic_vector(7 downto 0);
    signal enc_dec : std_logic := '0';
    
    begin
        dut: top port map(inByte => inByte, outByte => outByte, enc_dec => enc_dec);

end architecture;

PROC_SEQUENCE : process
begin

    -- Test all possible input values
    for i in 0 to 2**inByte'length - 1 loop
        inByte <= std_logic_vector(to_unsigned(i, inByte'length));
        wait for 10 ns;
    end loop;

    -- Finally, test the wrapped value
    inByte <= (others => '0');
    wait for 10 ns;

    report "Test: OK";
    finish;

end process;

PROC_CHECKER : process
    variable prev : std_logic_vector(outByte'range);
    variable count : integer;
begin
    wait on inByte; -- Equivalent to inByte in sensitivity list
    prev := outByte;
    wait for 1ns; -- Wait for DUT logic to propagate

    -- TODO: Write logic that checks if outByte is expected according to
    -- pre-written sBox tables

end process;