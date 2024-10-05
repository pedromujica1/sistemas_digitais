library ieee;
use ieee.std_logic_1164.all;

entity porta_OU_2in is
	port(
		A : in  std_logic;
		B : in  std_logic;
		S : out std_logic
	);
end porta_OU_2in;

architecture comportamento of porta_OU_2in is
begin
	S <= A or B;
end architecture comportamento;

