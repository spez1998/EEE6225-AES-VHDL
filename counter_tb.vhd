----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/12/07 14:30:04
-- Design Name: 
-- Module Name: counter_tb - tb
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_tb is
--  Port ( );
end counter_tb;

architecture tb of counter_tb is
        component Counter 
        port ( 
        CLK, SCLR, SET: in std_logic;
        A : out STD_LOGIC_VECTOR (4 downto 0)
        );
        end component;
        signal CLK :  STD_LOGIC := '0';
        signal SCLR :  STD_LOGIC := '1';
        signal SET :  STD_LOGIC := '0';
        signal A : STD_LOGIC_VECTOR (4 downto 0);
begin
    CLK <= not CLK after 10 ns;
    UUT: Counter port map(A => A, SET => SET, CLK => CLK, SCLR => SCLR);
    set <= '1' after 60 ns; SCLR <= '0' after 50 ns;
end tb;
