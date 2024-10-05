library ieee;
use ieee.std_logic_1164.all;

entity tb_semaforo is
	-- Entidade vazia
end tb_semaforo;

architecture TB_comportamento of tb_semaforo is

	component semaforo is
	port(
		sensorA : in  bit;
		sensorB : in  bit;
		lga : out bit;
		lgb : out bit;
		lra : out bit;
		lrb : out bit
	);
	end component;

  signal sA, sB : bit;
  signal sLGA, sLGB, sLRA, sLRB    : bit;

begin

    -- Declaração Explícita
    U_semaforo : semaforo port map(	
        sensorA => sA, 
        sensorB => sB,
        lga => sLGA,
        lgb => sLGB,
        lra => sLRA,
        lrb => sLRB
    );

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
