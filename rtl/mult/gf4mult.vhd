library IEEE;
use IEEE.std_logic_1164.all;

entity gf4mult is
        port(inByte  : in std_logic_vector (7 downto 0);
             outByte : out std_logic_vector (3 downto 0));
end gf4mult;

architecture struct of gf4mult is
    component gf2mult
        port(inNib  : in std_logic_vector (3 downto 0);
             outNib : out std_logic_vector (1 downto 0));
    end component;

    component phi
        port(inQ  : in std_logic_vector (1 downto 0);
             outQ : out std_logic_vector (1 downto 0));
    end component;
    
    begin
        gf2mult1: gf2mult port map(inNib(3 downto 2) => inByte(7 downto 6),
                                   inNib(1 downto 0) => inByte(1 downto 0));
        
                                   
        
        
        process(inByte) begin
            
            
        end process;
end struct;