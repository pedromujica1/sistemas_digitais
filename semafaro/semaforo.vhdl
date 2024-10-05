library ieee;
use ieee.std_logic_1164.all;

entity semaforo is
	port(
		sensorA : in  bit;
		sensorB : in  bit;
		lga : out bit;
		lgb : out bit;
		lra : out bit;
		lrb : out bit
	);
end semaforo;

architecture comportamento of semaforo is
begin
	lga <= not(sensorB) or sensorA;
	lrb <= not(sensorB) or sensorA;
	lgb <= not(sensorA) and sensorB;
	lra <= not(sensorA) and sensorB;
end architecture comportamento;

