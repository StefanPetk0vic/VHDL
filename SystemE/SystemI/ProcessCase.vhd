-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity SystemI is 
	port(ABCD: in std_logic_vector(3 downto 0);
    		F: out std_logic);
        end entity;

architecture  SystemI_arch of SystemI is 
	begin 
    	SystemI_PROC: process(ABCD) 
        	begin
				case(ABCD) is
                when "0001" | "1001" | "0011" | "1011" => F <='1';
                when others => F <='0';
                end case;
              end process;
             end architecture;


-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity SystemI_tb is end entity;

architecture SystemI_tb_arch of SystemI_tb is
	component SystemI is
		port(ABCD: in std_logic_vector(3 downto 0);
            		F: out std_logic);
	end component;
	
    signal ABCD_TB : std_logic_vector(3 downto 0);
    signal F_TB : std_logic;
    
    begin
    
    DUT1: SystemI port map(ABCD=>ABCD_TB,F=>F_TB);
    
    stimulus: process 
    begin
    	ABCD_TB<="1001";wait for 10ns;
        ABCD_TB<="1101";wait for 10ns;
        ABCD_TB<="1111";wait for 10ns;
        end process;
       end architecture;


