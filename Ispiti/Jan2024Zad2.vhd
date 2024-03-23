-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity Automat is
	port map(rst,clk,din:in std_logic;
    		 dout: out std_logic);
         end entity;
         
architecture Automat_arch of Automat is
	subtype state is std_logic_vector(2 downto 0);
    constant Stanje1 : state := "001";
    constant Stanje2 : state := "010";
    constant Stanje3 : state := "100";
    signal Trenutno,Sledece: state;
    
begin
	memorija: process(clk,rst)
    	begin
        	if (rst='0') then Trenutno<=Stanje1;
            elsif (rising_edge(clk)) then Trenutno<=Sledece;
            end if;
        end process;
        
    Prelazi: process(din,Trenutno) 
    	begin
        	case(Trenutno) is
            	when Stanje1=> if(din='1') then Sledece<=Stanje2;
                else Sledece<=Stanje1;
                end if;
                when Stanje2=> if(din='1') then Sledece<=Stanje3;
                else Sledece<=Stanje1;
                end if;
                when Stanje3=> if(din='1') then Sledece<=Stanje3;
                else Sledece<=Stanje1;
                end if;
                when others Sledece<=Stanje1;
                end case;
             end process;
     Izlazi: process(Trenutno,din)
     	begin
        	case(Trenutno) is
            	when Stanje1=> if(din='0') then dout<='0';
                else  dout<='1';
                 end if;
                when Stanje2=> if(din='1') then dout<='0';
                else dout<='0';
                 end if;
                when Stanje3=> if (din='0') then dout<='0';
                else dout<='0';
                end if;
                when others dout<='0';
                end case;
    	end process;
    end architecture;
   	
