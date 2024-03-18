-- Code your design here SELECT DODELA
library IEEE;
use IEEE.std_logic_1164.all;

entity mux8u1 is
    port(A: in bit_vector(7 downto 0);
         Sel: in bit_vector(2 downto 0);
         F: out bit);
    end entity;
    
architecture mux8u1_arch of mux8u1 is
begin F<= A(7) when (Sel="000") else
          A(6) when (Sel="001") else
          A(5) when (Sel="010") else
          A(4) when (Sel="011") else
          A(3) when (Sel="100") else
          A(2) when (Sel="101") else
          A(1) when (Sel="110") else
          A(0) when (Sel="111");
end architecture;


  -- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity mux1u8_tb is end entity;

architecture mux1u8_tb_arch of mux1u8_tb is 
    component mux8u1 is 
    port(A: in bit_vector(7 downto 0);
         Sel: in bit_vector(2 downto 0);
         F: out bit);
    end component;

signal A_TB : bit_vector (7 downto 0);
	signal S_TB :  bit_vector(2 downto 0);
	signal F_TB :  bit ;

begin
    DUT1: mux8u1 port map (A => A_TB, Sel=> S_TB, F => F_TB);
    
   
STIMULUS : process

	begin
		A_TB <= "00001001"; S_TB <= "000"; wait for 10 ns;
		A_TB <= "00001001"; S_TB <= "111"; wait for 10 ns;
	end process; 
    end architecture;

