library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



entity Counter is
   Port ( CLK, SCLR, SET: in std_logic;
          A : out std_logic_vector(4 downto 0));

end Counter;

architecture Behavioural of Counter is

   signal value : std_logic_vector( 1 downto 0);
   signal x,y : std_logic_vector( 1 downto 0) := "00";
   signal delay :  std_logic_vector( 3 downto 0) := "0000";
   signal n : std_logic := '0';
   
begin
   process (CLK, SCLR) begin
         if SCLR = '1' or set = '0' then
             value <= (others => '1');          
         elsif rising_edge(CLK) then
                if (set = '1') and (delay < 13) then
                    delay <= delay+1;
                end if;
                if (set = '0') and (delay /=0) then
                    delay <= delay+1;
                end if;
                if set = '1' and (delay = 13) then
                    value <= value - 1;         
                    if y = value and y /= "00" then 
                        n <= '1';
                        y <= y-1;
                    else n <= '0';
                    end if;
                else value <= (others => '1');
                end if;
                if value = "00" then 
                    x <= x+1;
                    y <= x+1;
                end if;
         end if;
   
   end process;

   
   A <=  n & value & "00";

end Behavioural;
