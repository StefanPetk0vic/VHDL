-- Code your design here USLOVNA DODELA
library IEEE;
use IEEE.std_logic_1164.all;

entity SystemE is 
    port(A,B,C: in bit;
    F: out bit);
    end entity;
    
architecture SystemE_arch of SystemE is
   begin 
        F<='1' when(A='0' and B='0' and C='1') else
            '1' when(A='1' and B='0' and C='0') else
            '1' when(A='0' and B='1' and C='1') else
            '1' when(A='1' and B='1' and C='0') else
            '0';
end architecture;

-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
entity SystemE_TB is end entity;

architecture SystemE_TB_arch of SystemE_TB is
    component SystemE
        port(A,B,C: in bit;
    F: out bit);
    end component;
    
    signal A_TB,B_TB,C_TB,F_TB: bit;
    
    begin
    DUT1: SystemE port map(A=> A_TB,
                        B=>B_TB,
                        C=>C_TB,
                        F=>F_TB);
   stimulus: process
        
        begin 
            A_TB <='0';
            B_TB <='0';
            C_TB <='0';
            wait for 10ns;
            
            A_TB <='0';
            B_TB <='1';
            C_TB <='0';
            wait for 10ns;
            
            end process;
            
         end architecture;
