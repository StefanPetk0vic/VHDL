-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity demux_1to8 is 
	port (Sel: in bit_vector (2 downto 0);
    	A: in bit;
        F: out bit_vector(7 downto 0));
end entity;

architecture demux_arch of demux_1to8 is
begin 
	F(0)<= (A and not Sel(2) and not Sel(1) and not Sel(0));
    F(1)<= (A and not Sel(2) and not  Sel(1)and Sel(0));
    F(2)<= (A and not Sel(2) and Sel(1) and not Sel(0));
    F(3)<= (A and not Sel(2) and Sel(1) and Sel(0));
    F(4)<= (A and Sel(2) and not Sel(1) and not Sel(0));
    F(5)<= (A and Sel(2) and not Sel(1) and Sel(0));
    F(6)<= (A and Sel(2) and Sel(1) and not Sel(0));
    F(7)<= (A and Sel(2) and Sel(1) and Sel(0));
end architecture;

-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
library STD;
use std.textio.all;

entity tb is end entity;

architecture tb_arch of tb is 
	component demux_1to8 is
   		 port (Sel: in bit_vector (2 downto 0);
    			A: in bit;
      			F: out bit_vector(7 downto 0));
	end component;
    	
    signal F_tb: bit_vector(7 downto 0);
    signal Sel_tb : bit_vector (2 downto 0);
    signal A_tb : bit;
    signal i : integer;
  
begin	--arch
    
dut: demux_1to8 port map (Sel_tb,A_tb,F_tb);
    
fajlovi: process 
    	
        file Fout : TEXT open WRITE_MODE is "output.txt";
        file Fin : TEXT open READ_MODE is "input.txt";
 	variable current_wline : line;
	variable current_rline : line;
        
	variable pomocnaA : bit;
        variable pomocnaS : bit_vector (2 downto 0);
        variable pomocnaF : bit_vector (7 downto 0);
    	
begin -- od file
		
         A_tb<='1';
         for i in 0 to 7 loop
          readline(Fin, current_rline);
          read(current_rline,pomocnaS);
          Sel_tb<=pomocnaS;
          wait for 10ns;

	  write (current_wline, string'("Sel: "));
          write (current_wline, Sel_tb);
          write (current_wline, string'("  F: "));
	  write (current_wline, F_tb);
          writeline(Fout, current_wline);
          end loop;
          wait;
	end process;
end architecture;
