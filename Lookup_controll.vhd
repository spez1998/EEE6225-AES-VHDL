library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity controll is
  Port ( CLK, SCLR, set: in std_logic;
          A : out std_logic_vector(4 downto 0));
end controll;

architecture Behavioral of controll is
    signal LOOKUP :  std_logic_vector( 4 downto 0):= "00000";
begin
    process (CLK) begin
    --RESET statement 
      if (SCLR = '1') then 
        A <= "11111";
        LOOKUP <= "00000";
        else 
    -------
        if rising_edge(CLK) then
                if set = '1'  or  LOOKUP /= "00000" then 
                    LOOKUP <= LOOKUP + 1;  
                    case LOOKUP is
                        --count delay from "00000" to "01011'
                        when "01100"=>
                        A <= "01100";
                        when "01101"=>
                        A <= "01000";    
                        when "01110"=>
                        A <= "00100";
                        when "01111"=>
                        A <= "00000";
                        when "10000"=>
                        A <= "01100";
                        when "10001"=>
                        A <= "01000";
                        when "10010"=>
                        A <= "00100";
                        when "10011"=>
                        A <= "10000";
                        when "10100"=>
                        A <= "01100";
                        when "10101"=>
                        A <= "01000";
                        when "10110"=>
                        A <= "10100";
                        when "10111"=>
                        A <= "10000";
                        when "11000"=>
                        A <= "01100";
                        when "11001"=>
                        A <= "11000";
                        when "11010"=>
                        A <= "10100";
                        when "11011"=>
                        A <= "10000";
                        when "11100"=>
                        when others =>
                            A <= "11111";
                    end case; 
             end if;
        end if;
       end if;
    end process;
end Behavioral;
