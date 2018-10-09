library ieee;
use ieee.std_logic_1164.all;

entity comparator is
	port(
		g_old : in std_logic;
		e_old : in std_logic;
		l_old : in std_logic;
		a : in std_logic;
		b : in std_logic;
		g : out std_logic;
		e : out std_logic;
		l : out std_logic);
end comparator;
	
architecture model of comparator is
begin
	g <= (a and (not b) and e_old) or g_old;
	e <= (a xnor b) and e_old;
	l <= ((not a) and b and e_old) or l_old;
end model;