library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sbox is
	Port (rst, clk : in STD_LOGIC;
	      in_byte  : in STD_LOGIC_VECTOR (7 downto 0);
	      out_byte : out STD_LOGIC_VECTOR (7 downto 0));
end sbox;

architecture behavioural of sbox is

begin
	
	lut : process (in_byte) is
	begin
		case input_byte is
			when x"00" => out_byte <= x"63";
			when x"01" => out_byte <= x"7c";
			when x"02" => out_byte <= x"77";
			when x"03" => out_byte <= x"7b";
			when x"04" => out_byte <= x"f2";
			when x"05" => out_byte <= x"6b";
			when x"06" => out_byte <= x"6f";
			when x"07" => out_byte <= x"c5";
			when x"08" => out_byte <= x"30";
			when x"09" => out_byte <= x"01";
			when x"0a" => out_byte <= x"67";
			when x"0b" => out_byte <= x"2b";
			when x"0c" => out_byte <= x"fe";
			when x"0d" => out_byte <= x"d7";
			when x"0e" => out_byte <= x"ab";
			when x"0f" => out_byte <= x"76";
			when x"10" => out_byte <= x"ca";
			when x"11" => out_byte <= x"82";
			when x"12" => out_byte <= x"c9";
			when x"13" => out_byte <= x"7d";
			when x"14" => out_byte <= x"fa";
			when x"15" => out_byte <= x"59";
			when x"16" => out_byte <= x"47";
			when x"17" => out_byte <= x"f0";
			when x"18" => out_byte <= x"ad";
			when x"19" => out_byte <= x"d4";
			when x"1a" => out_byte <= x"a2";
			when x"1b" => out_byte <= x"af";
			when x"1c" => out_byte <= x"9c";
			when x"1d" => out_byte <= x"a4";
			when x"1e" => out_byte <= x"72";
			when x"1f" => out_byte <= x"c0";
			when x"20" => out_byte <= x"b7";
			when x"21" => out_byte <= x"fd";
			when x"22" => out_byte <= x"93";
			when x"23" => out_byte <= x"26";
			when x"24" => out_byte <= x"36";
			when x"25" => out_byte <= x"3f";
			when x"26" => out_byte <= x"f7";
			when x"27" => out_byte <= x"cc";
			when x"28" => out_byte <= x"34";
			when x"29" => out_byte <= x"a5";
			when x"2a" => out_byte <= x"e5";
			when x"2b" => out_byte <= x"f1";
			when x"2c" => out_byte <= x"71";
			when x"2d" => out_byte <= x"d8";
			when x"2e" => out_byte <= x"31";
			when x"2f" => out_byte <= x"15";
			when x"30" => out_byte <= x"04";
			when x"31" => out_byte <= x"c7";
			when x"32" => out_byte <= x"23";
			when x"33" => out_byte <= x"c3";
			when x"34" => out_byte <= x"18";
			when x"35" => out_byte <= x"96";
			when x"36" => out_byte <= x"05";
			when x"37" => out_byte <= x"9a";
			when x"38" => out_byte <= x"07";
			when x"39" => out_byte <= x"12";
			when x"3a" => out_byte <= x"80";
			when x"3b" => out_byte <= x"e2";
			when x"3c" => out_byte <= x"eb";
			when x"3d" => out_byte <= x"27";
			when x"3e" => out_byte <= x"b2";
			when x"3f" => out_byte <= x"75";
			when x"40" => out_byte <= x"09";
			when x"41" => out_byte <= x"83";
			when x"42" => out_byte <= x"2c";
			when x"43" => out_byte <= x"1a";
			when x"44" => out_byte <= x"1b";
			when x"45" => out_byte <= x"6e";
			when x"46" => out_byte <= x"5a";
			when x"47" => out_byte <= x"a0";
			when x"48" => out_byte <= x"52";
			when x"49" => out_byte <= x"3b";
			when x"4a" => out_byte <= x"d6";
			when x"4b" => out_byte <= x"b3";
			when x"4c" => out_byte <= x"29";
			when x"4d" => out_byte <= x"e3";
			when x"4e" => out_byte <= x"2f";
			when x"4f" => out_byte <= x"84";
			when x"50" => out_byte <= x"53";
			when x"51" => out_byte <= x"d1";
			when x"52" => out_byte <= x"00";
			when x"53" => out_byte <= x"ed";
			when x"54" => out_byte <= x"20";
			when x"55" => out_byte <= x"fc";
			when x"56" => out_byte <= x"b1";
			when x"57" => out_byte <= x"5b";
			when x"58" => out_byte <= x"6a";
			when x"59" => out_byte <= x"cb";
			when x"5a" => out_byte <= x"be";
			when x"5b" => out_byte <= x"39";
			when x"5c" => out_byte <= x"4a";
			when x"5d" => out_byte <= x"4c";
			when x"5e" => out_byte <= x"58";
			when x"5f" => out_byte <= x"cf";
			when x"60" => out_byte <= x"d0";
			when x"61" => out_byte <= x"ef";
			when x"62" => out_byte <= x"aa";
			when x"63" => out_byte <= x"fb";
			when x"64" => out_byte <= x"43";
			when x"65" => out_byte <= x"4d";
			when x"66" => out_byte <= x"33";
			when x"67" => out_byte <= x"85";
			when x"68" => out_byte <= x"45";
			when x"69" => out_byte <= x"f9";
			when x"6a" => out_byte <= x"02";
			when x"6b" => out_byte <= x"7f";
			when x"6c" => out_byte <= x"50";
			when x"6d" => out_byte <= x"3c";
			when x"6e" => out_byte <= x"9f";
			when x"6f" => out_byte <= x"a8";
			when x"70" => out_byte <= x"51";
			when x"71" => out_byte <= x"a3";
			when x"72" => out_byte <= x"40";
			when x"73" => out_byte <= x"8f";
			when x"74" => out_byte <= x"92";
			when x"75" => out_byte <= x"9d";
			when x"76" => out_byte <= x"38";
			when x"77" => out_byte <= x"f5";
			when x"78" => out_byte <= x"bc";
			when x"79" => out_byte <= x"b6";
			when x"7a" => out_byte <= x"da";
			when x"7b" => out_byte <= x"21";
			when x"7c" => out_byte <= x"10";
			when x"7d" => out_byte <= x"ff";
			when x"7e" => out_byte <= x"f3";
			when x"7f" => out_byte <= x"d2";
			when x"80" => out_byte <= x"cd";
			when x"81" => out_byte <= x"0c";
			when x"82" => out_byte <= x"13";
			when x"83" => out_byte <= x"ec";
			when x"84" => out_byte <= x"5f";
			when x"85" => out_byte <= x"97";
			when x"86" => out_byte <= x"44";
			when x"87" => out_byte <= x"17";
			when x"88" => out_byte <= x"c4";
			when x"89" => out_byte <= x"a7";
			when x"8a" => out_byte <= x"7e";
			when x"8b" => out_byte <= x"3d";
			when x"8c" => out_byte <= x"64";
			when x"8d" => out_byte <= x"5d";
			when x"8e" => out_byte <= x"19";
			when x"8f" => out_byte <= x"73";
			when x"90" => out_byte <= x"60";
			when x"91" => out_byte <= x"81";
			when x"92" => out_byte <= x"4f";
			when x"93" => out_byte <= x"dc";
			when x"94" => out_byte <= x"22";
			when x"95" => out_byte <= x"2a";
			when x"96" => out_byte <= x"90";
			when x"97" => out_byte <= x"88";
			when x"98" => out_byte <= x"46";
			when x"99" => out_byte <= x"ee";
			when x"9a" => out_byte <= x"b8";
			when x"9b" => out_byte <= x"14";
			when x"9c" => out_byte <= x"de";
			when x"9d" => out_byte <= x"5e";
			when x"9e" => out_byte <= x"0b";
			when x"9f" => out_byte <= x"db";
			when x"a0" => out_byte <= x"e0";
			when x"a1" => out_byte <= x"32";
			when x"a2" => out_byte <= x"3a";
			when x"a3" => out_byte <= x"0a";
			when x"a4" => out_byte <= x"49";
			when x"a5" => out_byte <= x"06";
			when x"a6" => out_byte <= x"24";
			when x"a7" => out_byte <= x"5c";
			when x"a8" => out_byte <= x"c2";
			when x"a9" => out_byte <= x"d3";
			when x"aa" => out_byte <= x"ac";
			when x"ab" => out_byte <= x"62";
			when x"ac" => out_byte <= x"91";
			when x"ad" => out_byte <= x"95";
			when x"ae" => out_byte <= x"e4";
			when x"af" => out_byte <= x"79";
			when x"b0" => out_byte <= x"e7";
			when x"b1" => out_byte <= x"c8";
			when x"b2" => out_byte <= x"37";
			when x"b3" => out_byte <= x"6d";
			when x"b4" => out_byte <= x"8d";
			when x"b5" => out_byte <= x"d5";
			when x"b6" => out_byte <= x"4e";
			when x"b7" => out_byte <= x"a9";
			when x"b8" => out_byte <= x"6c";
			when x"b9" => out_byte <= x"56";
			when x"ba" => out_byte <= x"f4";
			when x"bb" => out_byte <= x"ea";
			when x"bc" => out_byte <= x"65";
			when x"bd" => out_byte <= x"7a";
			when x"be" => out_byte <= x"ae";
			when x"bf" => out_byte <= x"08";
			when x"c0" => out_byte <= x"ba";
			when x"c1" => out_byte <= x"78";
			when x"c2" => out_byte <= x"25";
			when x"c3" => out_byte <= x"2e";
			when x"c4" => out_byte <= x"1c";
			when x"c5" => out_byte <= x"a6";
			when x"c6" => out_byte <= x"b4";
			when x"c7" => out_byte <= x"c6";
			when x"c8" => out_byte <= x"e8";
			when x"c9" => out_byte <= x"dd";
			when x"ca" => out_byte <= x"74";
			when x"cb" => out_byte <= x"1f";
			when x"cc" => out_byte <= x"4b";
			when x"cd" => out_byte <= x"bd";
			when x"ce" => out_byte <= x"8b";
			when x"cf" => out_byte <= x"8a";
			when x"d0" => out_byte <= x"70";
			when x"d1" => out_byte <= x"3e";
			when x"d2" => out_byte <= x"b5";
			when x"d3" => out_byte <= x"66";
			when x"d4" => out_byte <= x"48";
			when x"d5" => out_byte <= x"03";
			when x"d6" => out_byte <= x"f6";
			when x"d7" => out_byte <= x"0e";
			when x"d8" => out_byte <= x"61";
			when x"d9" => out_byte <= x"35";
			when x"da" => out_byte <= x"57";
			when x"db" => out_byte <= x"b9";
			when x"dc" => out_byte <= x"86";
			when x"dd" => out_byte <= x"c1";
			when x"de" => out_byte <= x"1d";
			when x"df" => out_byte <= x"9e";
			when x"e0" => out_byte <= x"e1";
			when x"e1" => out_byte <= x"f8";
			when x"e2" => out_byte <= x"98";
			when x"e3" => out_byte <= x"11";
			when x"e4" => out_byte <= x"69";
			when x"e5" => out_byte <= x"d9";
			when x"e6" => out_byte <= x"8e";
			when x"e7" => out_byte <= x"94";
			when x"e8" => out_byte <= x"9b";
			when x"e9" => out_byte <= x"1e";
			when x"ea" => out_byte <= x"87";
			when x"eb" => out_byte <= x"e9";
			when x"ec" => out_byte <= x"ce";
			when x"ed" => out_byte <= x"55";
			when x"ee" => out_byte <= x"28";
			when x"ef" => out_byte <= x"df";
			when x"f0" => out_byte <= x"8c";
			when x"f1" => out_byte <= x"a1";
			when x"f2" => out_byte <= x"89";
			when x"f3" => out_byte <= x"0d";
			when x"f4" => out_byte <= x"bf";
			when x"f5" => out_byte <= x"e6";
			when x"f6" => out_byte <= x"42";
			when x"f7" => out_byte <= x"68";
			when x"f8" => out_byte <= x"41";
			when x"f9" => out_byte <= x"99";
			when x"fa" => out_byte <= x"2d";
			when x"fb" => out_byte <= x"0f";
			when x"fc" => out_byte <= x"b0";
			when x"fd" => out_byte <= x"54";
			when x"fe" => out_byte <= x"bb";
			when x"ff" => out_byte <= x"16";
			when others => null;
		end case;

	end process lut;

end behavioural;
