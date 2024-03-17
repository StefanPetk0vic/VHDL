-- Code your design here SELECT DODELA
library IEEE;
use IEEE.std_logic_1164.all;

entity demux1u8 is 
	port(A: in bit;
    		S: in bit_vector(2 downto 0);
    		F: out bit_vector(0 to 7));
end entity;

architecture demux1u8_arch of demux1u8
	is begin
    	with (S) select
        	F(7)<= A when "000",'0' when others;
       	 	with (S) select
        	F(6)<= A when "001",'0' when others;
            with (S) select
        	F(5)<= A when "010",'0' when others;
            with (S) select
        	F(4)<= A when "011",'0' when others;
            with (S) select
        	F(3)<= A when "100",'0' when others;
            with (S) select
        	F(2)<= A when "101",'0' when others;
            with (S) select
        	F(1)<= A when "110",'0' when others;
            with (S) select
        	F(0)<= A when "111",'0' when others;
      end architecture;


-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity demux1u8_tb is end entity;

architecture demux1u8_tb_arch of demux1u8_tb is 
	component demux1u8 is 
	port(A: in bit;
    		S: in bit_vector(2 downto 0);
    		F: out bit_vector(7 downto 0));
end component;

signal A_TB : bit;
signal S_TB : bit_vector(2 downto 0);
signal F_TB : bit_vector(7 downto 0);

begin
	DUT: demux1u8 port map(A=>A_TB,S=>s_TB,F=>F_TB);
    
    stimulus: process
    begin
    A_TB<='1';
    S_TB<="001";
    wait for 10ns;
    
	A_TB<='0';
    S_TB<="110";
    wait for 10ns;
    end process;
    end architecture;
