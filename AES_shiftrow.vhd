----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/12/07 11:35:17
-- Design Name: 
-- Module Name: AES_shiftrow - Behavioral
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
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
        component Counter 
        port ( 
        CLK, SCLR, SET: in std_logic;
        A : out STD_LOGIC_VECTOR (4 downto 0)
        );
        end component;
        
        signal A: STD_LOGIC_VECTOR (4 downto 0);
begin
        SR_controll: Counter port map(A => A, SET => SET, CLK => CLK, SCLR => SCLR);
        OUTDATA: c_shift_ram_0 port map(D => D, A => A, Q => Q, CLK => CLK, SCLR => SCLR);
        
end Behavioral;
