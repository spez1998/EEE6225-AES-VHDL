----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/11/30 15:13:35
-- Design Name: 
-- Module Name: AES_shiftrow_8bit - Behavioral
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



entity AES_shiftrow_8bit_tb is
--  Port ( );
end AES_shiftrow_8bit_tb;

architecture tb of AES_shiftrow_8bit_tb is
    component AES_shiftrow 
        port ( 
        CLK,SCLR,SET : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (7 downto 0);
        Q : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
        signal CLK :  STD_LOGIC := '0';
        signal SCLR :  STD_LOGIC := '1';
        signal SET :  STD_LOGIC := '0';
        signal D :  STD_LOGIC_VECTOR (7 downto 0):= "00000000";
        signal Q :  STD_LOGIC_VECTOR (7 downto 0);
begin
    CLK <= not CLK after 10 ns;
    UUT : AES_shiftrow port map (CLK => CLK, SET => SET, SCLR => SCLR, D => D, Q => Q);
    tb1 : process
        constant period: time := 20 ns;
        begin
            SCLR <= '0' after 50 ns;
            
           wait for 70 ns;
            SET <= '1';
            D <= "00000001"; wait for period;
            D <= "00000010"; wait for period;
            D <= "00000011"; wait for period;
            D <= "00000100"; wait for period;
            D <= "00000101"; wait for period;
            D <= "00000110"; wait for period;
            D <= "00000111"; wait for period;
            D <= "00001000"; wait for period;
            D <= "00001001"; wait for period;
            D <= "00010000"; wait for period;
            D <= "00010001"; wait for period;
            D <= "00010010"; wait for period;
            D <= "00010011"; wait for period;
--            SET <= '1';
            D <= "00010100"; wait for period;
            D <= "00010101"; wait for period;
            D <= "00010110"; wait for period;
            D <= "00000001"; wait for period;
            D <= "00000010"; wait for period;
            D <= "00000011"; wait for period;
            D <= "00000100"; wait for period;
            D <= "00000101"; wait for period;
            D <= "00000110"; wait for period;
            D <= "00000111"; wait for period;
            D <= "00001000"; wait for period;
            D <= "00001001"; wait for period;
            D <= "00010000"; wait for period;
            D <= "00010001"; wait for period;
            D <= "00010010"; wait for period;
            D <= "00010011"; wait for period;
            D <= "00010100"; wait for period;
            D <= "00010101"; wait for period;
            D <= "00010110"; wait for period;
            wait;
        end process;
end tb;
