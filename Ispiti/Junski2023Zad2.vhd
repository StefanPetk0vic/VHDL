-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity Automat is 
	port(rst,clk,din : in std_logic;
    		dout: out std_logic);
     end entity;

architecture Automat_arch of Automat is
	subtype state is std_logic_vector(3 downto 0);
    constant Stanje0 : state:="0001";
    constant Stanje1 : state:="0010";
    constant Stanje2 : state:="0100";
    constant Stanje3 : state:="1000";
   	signal trenutno,sledece: state;
    
    begin 
    	memorija: process(clk,rst) begin
        if(clk='0') then trenutno<=Stanje0;
        elsif(rising_edge(clk)) then trutno<=sledece;
        end if;
        end process;
        
        Prelaz: process(trenutno,din)
        begin 
        	case(trenutno) is
        		when Stanje0=> if(din='0') then sledece<=Stanje1;
                else sledece<=Stanje2;
                end if;
                when Stanje1=> if(din='0')then sledece<=Stanje0;
                else sledece<=Stanje3;
                end if;
                when Stanje2=> if(din='0') then sledece<=Stanje3;
                else sledece<=Stanje0;
                end if;
                when Stanje3=>if(din='0') then sledece<=Stanje2;
                else sledece<=Stanje1;
                end if;
                end case;
                end process;
         Izlazi: process(trenutno,din) begin
         	case(trenutno) is
            	when Stanje0=> if(din='0') then dout<='0';
                else dout<='0';
                end if;
                when Stanje1=> if(din='0')then dout<='1';
                else dout<='0';
                end if;
                when Stanje2=> if(din='0')then dout<='0';
                else dout<='1';
                end if;
                when Stanje3=>if(din='0')then dout<='0';
                else dout<='0';
                end if;
                when others<='0';
                end case;
                end process;
                end architecture;
