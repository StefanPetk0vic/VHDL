-- Code your design here SELECT DODELA
library IEEE;
use IEEE.std_logic_1164.all;

entity Decoder4u16 is
	port (A:in bit_vector(3 downto 0);
    		F:out bit_vector(15 downto 0));
    end entity;
    
architecture Decoder4u16_arch of Decoder4u16 is
begin
    with A select
        F <= "0000000000000001" when "0000",                                     
             "0000000000000010" when "0001",
             "0000000000000100" when "0010",
             "0000000000001000" when "0011",
             "0000000000010000" when "0100",
             "0000000000100000" when "0101",
             "0000000001000000" when "0110",
             "0000000010000000" when "0111", 
             "0000000100000000" when "1000",
             "0000001000000000" when "1001",
             "0000010000000000" when "1010",
             "0000100000000000" when "1011",
             "0001000000000000" when "1100",
             "0010000000000000" when "1101",
             "0100000000000000" when "1110",
             "1000000000000000" when "1111",
             (others => '0') when others;
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
