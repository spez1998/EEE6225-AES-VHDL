library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity AES_shiftrow is
        port ( 
        CLK,SCLR,SET : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (7 downto 0);
        Q : out STD_LOGIC_VECTOR (7 downto 0));
end AES_shiftrow;

architecture Behavioral of AES_shiftrow is
        
        component c_shift_ram_0 
        port ( 
        CLK : in STD_LOGIC;
        SCLR : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (7 downto 0);
        A : in STD_LOGIC_VECTOR (4 downto 0);
        Q : out STD_LOGIC_VECTOR (7 downto 0)
        );
        end component;
        
        component LOOKUP_controll 
        port ( 
        CLK, SCLR, SET: in std_logic;
        A : out STD_LOGIC_VECTOR (4 downto 0)
        );
        end component;
        
        signal A: STD_LOGIC_VECTOR (4 downto 0);

begin
-----------------------------------------------------
--        genrate A
        SR_controll: LOOKUP_controll port map(A => A, SET => SET, CLK => CLK, SCLR => SCLR); 
-----------------------------------------------------   
--        8 bit 25 register FIFO shifter
--        input: 8bit data per clock 
--        output: 8bit selected data per clock by doing the selection by changing A
        
        OUTDATA: c_shift_ram_0 port map(D => D, A => A, Q => Qout, CLK => CLK, SCLR => SCLR);
-----------------------------------------------------
--      not sending data before the encrpty and decrpty start
        Q <= (others => '0') when A = "11111" else Qout;        
end Behavioral;
