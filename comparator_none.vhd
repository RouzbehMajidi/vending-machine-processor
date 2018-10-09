library ieee;
use ieee.std_logic_1164.all;

entity comparator_none is
	port(
		a : in std_logic;
		b : in std_logic;
		g : out std_logic;
		e : out std_logic;
		l : out std_logic);
end comparator_none;
	
architecture model of comparator_none is
begin
	g <= (a and (not b));
	e <= (a xnor b);
	l <= ((not a) and b);
end model;