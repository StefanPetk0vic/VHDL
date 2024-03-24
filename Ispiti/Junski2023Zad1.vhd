-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity INV is 
	port(A:in bit;
    		F: out bit);
            end entity;
architecture INV_arch of INV is 
	begin
	F<= not A;
    end architecture;
    
entity AND4 is
	port(A,B,C,D: in bit;
    		F:out bit);
            end entity;
architecture AND4_arch of AND4 is
	begin
	F<=A and B and C and D;
end architecture;

entity OR4 is 
	port(m1,m3,m9,m11: in bit;
    		F:out bit);
			end entity;
architecture OR4_arch of OR4 is
	begin
    F<=m1 or m3 or m9 or m11;
    end architecture;


entity SystemI is 
	port(A,B,C,D: in bit;
    		F: out bit);
            end entity;

architecture SystemI_arch of SystemI is
    	component INV is
        	port(A:in bit;
    		F: out bit);
            end component;
        component AND4 is
        	port(A,B,C,D: in bit;
    		F:out bit);
            end component;
        component OR4 is
			port(m1,m3,m9,m11: in bit;
    		F:out bit);
			end component;
            signal An,Bn,Cn,Dn: bit;
            signal m1,m3,m9,m11:bit;
            begin
            I1: INV port map(A,An);
            I2: INV port map(B,Bn);
            I3: INV port map(C,Cn);
            I4: INV port map(D,Dn);
            A1: AND4 port map(An,Bn,Cn,D,m1);
            A2: AND4 port map(An,Bn,C,D,m3);
            A3: AND4 port map(A,Bn,Cn,D,m9);
            A4: AND4 port map(A,Bn,C,D,m11);
         	O4: OR4 port map(m1,m3,m9,m11,F);
           end architecture;
            
             
          -- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity SystemI_tb is end entity;

architecture SystemI_tb_arch of SystemI_tb is
	component SystemI is
    	port(A,B,C,D:in bit;
        		F:out bit);
                end component;
    signal A_TB,B_TB,C_TB,D_TB: bit;
    signal F_TB:bit;
    begin
    DUT1: SystemI port map(A_TB,B_TB,C_TB,D_TB,F_TB);
    
    stimulus: process
    	begin 
        	A_TB<='0';
            B_TB<='0';
            C_TB<='0';
            D_TB<='1';
            wait for 10ns;
            
        	A_TB<='0';
            B_TB<='0';
            C_TB<='1';
            D_TB<='1';
            wait for 10ns;
               
        	A_TB<='0';
            B_TB<='0';
            C_TB<='0';
            D_TB<='0';
            wait for 10ns;
            
        	A_TB<='1';
            B_TB<='0';
            C_TB<='1';
            D_TB<='1';
            wait for 10ns;
            end process;
    end architecture;
      
