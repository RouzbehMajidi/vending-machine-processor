library ieee;

USE ieee.std_logic_1164.all;
USE work.all;

entity subtractor8 is
	port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		result : out std_logic_vector(7 downto 0)
		);
end subtractor8;

architecture model of subtractor8 is
component adder8 IS
  port(
	a : in std_logic_vector(7 downto 0);
	b : in std_logic_vector(7 downto 0);
	c_in: in std_logic;
	s: out std_logic_vector(7 downto 0);
	c_out: out std_logic
	);
end component;

signal c_in : std_logic := '1';
signal c_out : std_logic;

begin
	subtractor : adder8 port map (a,(not b),c_in,result,c_out);
end model;
