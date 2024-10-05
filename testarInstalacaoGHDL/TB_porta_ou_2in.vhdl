library ieee;
use ieee.std_logic_1164.all;

entity TB_porta_2in is
	-- Entidade vazia
end TB_porta_2in;

architecture TB_comportamento of TB_porta_2in is

	component porta_OU_2in is
	port(
		A : in  std_logic;
		B : in  std_logic;
		S : out std_logic
	);
	end component;

  signal sA, sB : std_logic;
  signal sOu    : std_logic;

begin
	
	-- Declaração implícita/posicional
	U_porta_OU_2in : porta_OU_2in 
	port map(sA, sB, sOu);

	U_TB : process
	begin
		sA <= '0';
		sB <= '0';
		wait for 10 ns;

		sA <= '0';
		sB <= '1';
		wait for 10 ns;

		sA <= '1';
		sB <= '0';
		wait for 10 ns;

		sA <= '1';
		sB <= '1';

		wait for 10 ns;
		
		wait;		

	end process U_TB;

end architecture TB_comportamento;
