library ieee;

USE ieee.std_logic_1164.all;
USE work.all;

entity mux21 is
	port(
		A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		s : in std_logic;
		output : out std_logic_vector(7 downto 0)
		);
end mux21;

architecture model of mux21 is 
begin
	output <= B when (s = '1') else A;
end model;