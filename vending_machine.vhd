library ieee;

USE ieee.std_logic_1164.all;
USE work.all;

entity vending_machine is
	port(
		C : in std_logic;
		V : in std_logic_vector(7 downto 0);
		S0 : in std_logic_vector(7 downto 0);
		S1 : in std_logic_vector(7 downto 0);
		choice : in std_logic;
		P : out std_logic_vector(7 downto 0);
		E : out std_logic_vector(7 downto 0);
		D : out std_logic_vector(1 downto 0);
		reset : in std_logic;
		clk : in std_logic
		);
end vending_machine;

architecture rtl of vending_machine is
component accumulator8 is
	port(
		clk: in std_logic;
		reset: in std_logic;
		data_in : in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0)
		);
end component;

component subtractor8 is
	port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		result : out std_logic_vector(7 downto 0)
		);
end component;

component comparator8 is
	port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		g_out : out std_logic;
		e_out : out std_logic;
		l_out : out std_logic);
end component;

component mux21 is
	port(
		A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		s : in std_logic;
		output : out std_logic_vector(7 downto 0)
		);
end component;

signal balance : std_logic_vector(7 downto 0);
signal price : std_logic_vector(7 downto 0);
signal balance_greater : std_logic;
signal balance_equal : std_logic;
signal balance_lower : std_logic;
signal coins_to_return : std_logic_vector(7 downto 0);
signal reset_acc : std_logic;

begin
	mux : mux21 port map(S0, S1, choice, price);
	accumulator : accumulator8 port map(clk, reset_acc, V, balance);
	comparator : comparator8 port map(balance, price, balance_greater, balance_equal, balance_lower);
	subtractor : subtractor8 port map (balance, price, coins_to_return);

	process(reset, balance_greater, balance_equal, balance_lower)
	begin
		if (reset = '0') then
			E <= balance;
		else 
			P <= balance;
			if (balance_equal = '1' or balance_greater = '1') then
				E <= coins_to_return;
				if(choice = '0') then
					D <= "01";
				else
					D <= "10";
				end if;
				reset_acc <= '0';
			end if;
			
			if(balance_lower = '1') then
				E <= "00000000";
				D <= "00";
			end if;
		end if;
		reset_acc <= reset;
	end process;
end rtl;

