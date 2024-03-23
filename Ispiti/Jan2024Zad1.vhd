-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity SystemE is 
	port(A,B,C: in bit;
    	 F: out bit);
         end entity;
         
architecture SystemE_arch of SystemE is
signal ABC: bit_vector(2 downto 0);
	begin
    ABC<=A&B&C;
    with (ABC) select
    	F <='1' when "001",
        	'1'	when "010",
            '1' when "101",
            '0' when others;
   end architecture;
         
entity ThreeSystemE is 
	port(A1,B1,C1,A2,B2,C2,A3,B3,C3: in bit;
    	 Fout: out bit);
         end entity;
         
architecture ThreeSystemE_arch of ThreeSystemE is
	component SystemE is
    	port(A,B,C: in bit;
    	 F: out bit);
         end component;
    signal F1,F2,F3: bit;
    begin
    SE1: SystemE port map(A1,B1,C1,F1);
    SE2: SystemE port map(A2,B2,C2,F2);
    SE3: SystemE port map(A3,B3,C3,F3);
    
    Fout<=F1 and F2 and F3;
    
    end architecture;
   	
-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
entity ThreeSystemE_TB is end entity;

architecture ThreeSystemE_TB_arch of ThreeSystemE_TB is
    component ThreeSystemE is
        port(A1,B1,C1,A2,B2,C2,A3,B3,C3: IN bit;
    	 Fout: out bit);
         end component;
    
    signal A1,B1,C1,A2,B2,C2,A3,B3,C3: bit;
    signal Fout: bit;
    
    begin
    	UUT: ThreeSystemE port map(A1,B1,C1,A2,B2,C2,A3,B3,C3,Fout);
    stimulus: process
        
        begin 

            A1<='0';
            B1<='0';
            C1<='1';
            
            A2<='0';
            B2<='1';
            C2<='0';
            
            A3<='1';
            B3<='0';
            C3<='1';
            wait for 10ns;
            
            A1<='0';
            B1<='1';
            C1<='1';
            
            A2<='0';
            B2<='1';
            C2<='0';
            
            A3<='1';
            B3<='0';
            C3<='1';
            wait for 10ns;
            
            end process;
            
         end architecture;
