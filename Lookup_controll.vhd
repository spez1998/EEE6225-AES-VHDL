begin
    process (CLK) begin
        
        if rising_edge(CLK) then
                if (delay /= 0) and set = '1' then
                    delay <= delay - 1;
                    A <= "11111";                  
                end if;
                if (delay = 1 or delay = 0) then 
                    case LOOKUP is
                        when "0000"=>
                        A <= "01100";
                        when "0001"=>
                        A <= "01000";
                        when "0010"=>
                        A <= "00100";
                        when "0011"=>
                        A <= "00000";
                        when "0100"=>
                        A <= "01100";
                        when "0101"=>
                        A <= "01000";
                        when "0110"=>
                        A <= "00100";
                        when "0111"=>
                        A <= "10000";
                        when "1000"=>
                        A <= "01100";
                        when "1001"=>
                        A <= "01000";
                        when "1010"=>
                        A <= "10100";
                        when "1011"=>
                        A <= "10000";
                        when "1100"=>
                        A <= "01100";
                        when "1101"=>
                        A <= "11000";
                        when "1110"=>
                        A <= "10100";
                        when "1111"=>
                        A <= "10000";
                        when others =>
                        A <= "11111";
                        delay <= "1100";
                    end case; 
                    if (set /= '0') or (LOOKUP /= "0000") then
                        LOOKUP <= LOOKUP + 1;
                    end if;               
                end if;
        end if;
    end process;
end Behavioral;
