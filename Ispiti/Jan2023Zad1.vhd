-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity demux1to8 is
	port(A:in bit;
    		Sel: in bit_vector(2 downto 0);
            	F: out bit_vector(7 downto 0));
               end entity;
               
architecture demux1to8_arch of demux1to8 is
	begin 
       F(0)<=(A and not Sel(2) and not Sel(1) and not Sel(0));
       F(1)<=(A and not Sel(2) and not Sel(1) and Sel(0));
       F(2)<=(A and not Sel(2) and  Sel(1) and not Sel(0));
       F(3)<=(A and not Sel(2) and Sel(1) and Sel(0));
       F(4)<=(A and Sel(2) and not Sel(1) and not Sel(0));
       F(5)<=(A and Sel(2) and not Sel(1) and Sel(0));
       F(6)<=(A and Sel(2) and Sel(1) and not Sel(0));
       F(7)<=(A and Sel(2) and Sel(1) and Sel(0));
       
       end architecture;


         -- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

 entity demux1to8_tb is end entity;
 
 architecture demux1to8_tb_arch of demux1to8_tb is
 		component demux1to8 is
        	port(A:in bit;
    		Sel: in bit_vector(2 downto 0);
            	F: out bit_vector(7 downto 0));
               end component;
        signal A_TB: bit;
        signal SEL_TB:bit_vector(2 downto 0);
        signal F_TB:bit_vector(7 downto 0);

begin 
	DUT1: demux1to8 port map(A_TB,SEL_TB,F_TB);
    
   stimulus: process
   	begin
    	A_TB<='1';
        SEL_TB<="001";
        wait for 10ns;
        A_TB<='1';
        SEL_TB<="011";
        wait for 10ns;
        A_TB<='1';
        SEL_TB<="101";
        wait for 10ns;
        A_TB<='1';
        SEL_TB<="111";
        wait for 10ns;
        end process;
        end architecture;
