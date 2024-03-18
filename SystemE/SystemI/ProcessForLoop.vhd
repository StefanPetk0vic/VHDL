-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity counter_integer_up is
	port(Count: integer);
    end entity;

architecture counter_integer_up_arch of counter_integer_up is
	begin 
    	counter: process 
        	signal i: integer;
            begin	
            	for i in 0 to 31 loop
                	count<=i;
                    wait for 10 ns;
                    end loop;
                    end process;
                    end architecture;
