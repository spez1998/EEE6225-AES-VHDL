library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity controll is
   Port ( CLK, SCLR, SET: in std_logic;
          A : out std_logic_vector(4 downto 0));
end controll;

architecture Behavioural of controll is
   
   signal value : std_logic_vector( 1 downto 0) := "11";
   signal x,y : std_logic_vector( 1 downto 0) := "00";
   signal delay :  std_logic_vector( 3 downto 0) := "0000";
   signal cd :  std_logic_vector( 3 downto 0) := "1111";
   signal n : std_logic := '0';
   
begin
   process (CLK) begin
        --reset when SCLR on or no data in
         if SCLR = '1' or ((set = '0') and (delay = 0)) then
             A <= (others => '1');  
         elsif rising_edge(CLK) then
         -- wait data enter to R13
                if (set = '1') and (delay < 12) then
                    delay <= delay + 1;                    
                end if;
                if set = '1' and (delay < 12) then
                    A <= (others => '1');                      
                end if;          
         -- data arrive R13                
                if ((cd < "1111" and set = '0')or (set = '1' and delay = 12)) then
         -- value: 2 bits count down
                    value <= value - 1;       
         -- cd: use for count the num of data           
                   cd <= cd - 1;  
         -- x,y: help to give correct n
                    if y = value  and y /= "00" then 
                        n <= '1';
                        y <= y - 1;
                    else n <= '0';
                    end if;
         -- output A              
                    A <=  n & value & "00"; 
                end if;
         -- x,y: count x,y         
                if (value = "00" and ((cd < "1111" and set = '0')or (set = '1' and delay = 12)))then 
                    x <= x + 1;
                    y <= x + 1;
                end if;  
         -- reset after all data output          
                if (set = '0') and (cd = "1111")then
                    delay <= (others => '0');
                end if;
         end if;  
   end process;
end Behavioural;
