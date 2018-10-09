library ieee;

USE ieee.std_logic_1164.all;
USE work.all;

entity register8 is
	port(
		clk: in std_logic;
		reset : in std_logic;
		regin : in std_logic_vector(7 downto 0);
		regout : out std_logic_vector(7 downto 0)
		);
end register8;

architecture rtl of register8 is
begin
	process(clk, reset)
	begin 
		if (rising_edge(clk)) then
			if(reset = '0') then
				regout <= "00000000";
			else
				regout <= regin;
			end if;
		end if;
	end process;
end rtl;
			
