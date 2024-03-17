-- Code your design here KONKURENTNA DODELA
library IEEE;
use IEEE.std_logic_1164.all;

entity Decoder4u16 is
	port (A:in bit_vector(3 downto 0);
    		F:out bit_vector(15 downto 0));
    end entity;
    
architecture Decoder4u16_arch of Decoder4u16 is
	begin
F(0) <= not A(3) and not A(2) and not A(1) and not A(0);
F(1) <= not A(3) and not A(2) and not A(1) and A(0);
F(2) <= not A(3) and not A(2) and A(1) and not A(0);
F(3) <= not A(3) and not A(2) and A(1) and A(0);
F(4) <= not A(3) and A(2) and not A(1) and not A(0);
F(5) <= not A(3) and A(2) and not A(1) and A(0);
F(6) <= not A(3) and A(2) and A(1) and not A(0);
F(7) <= not A(3) and A(2) and A(1) and A(0);
F(8) <= A(3) and not A(2) and not A(1) and not A(0);
F(9) <= A(3) and not A(2) and not A(1) and A(0);
F(10) <= A(3) and not A(2) and A(1) and not A(0);
F(11) <= A(3) and not A(2) and A(1) and A(0);
F(12) <= A(3) and A(2) and not A(1) and not A(0);
F(13) <= A(3) and A(2) and not A(1) and A(0);
F(14) <= A(3) and A(2) and A(1) and not A(0);
F(15) <= A(3) and A(2) and A(1) and A(0);
end architecture;

-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity Decoder4u16_tb is end entity;

architecture Decoder4u16_tb_arch of Decoder4u16_tb is 

    signal A_TB: bit_vector(3 downto 0);
    signal F_TB: bit_vector(15 downto 0);
    
	component Decoder4u16
	port (A:in bit_vector(3 downto 0);
    		F:out bit_vector(15 downto 0));
    end component;
    begin
    DUT: Decoder4u16 port map(A=>A_TB,F=>F_TB);
    
    stimulus: process
    begin
    	A_TB <= "0000"; wait for 10ns;
        
    	A_TB <= "0001"; wait for 10ns;
        
    	A_TB <= "0010"; wait for 10ns;
        
        end process;
       end architecture;
  
