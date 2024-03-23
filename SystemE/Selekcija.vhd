-- Code your design here SELEKCIJA
library IEEE;
use IEEE.std_logic_1164.all;

entity SystemE is 
    port(A,B,C: in bit;
    F: out bit);
    end entity;
    
architecture SystemE_arch of SystemE is
   signal ABC: bit_vector(2 downto 0);
  ABC <= A & B & C;
   begin 
        with ABC select
            F<='1' when "001",
            '1' when "011",
            '1' when "100",
            '1' when "110",
            '0' when others;
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
