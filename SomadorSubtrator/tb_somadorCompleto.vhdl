library ieee;
use ieee.std_logic_1164.all;

entity tb_somadorCompleto is

end entity;

architecture soma of tb_somadorCompleto is
    component somadorCompleto
        port (
            x,y,cin : in std_logic;
            s,cout : out std_logic
        );
    end component;

--Declarar os sinais
signal Sx : std_logic;
signal Sy : std_logic;
signal Scin : std_logic;
signal Ss : std_logic;
signal Scout : std_logic;

begin
    u_somador : somadorCompleto port map(Sx,Sy,Scin,Ss,Scout);
    u_tb:process
    begin
    --definindo valores
    Sx <= '1';
    Sy <= '1';
    Scin <= '0';

    --esperando 1 ciclo
    wait for 1 ns;

    --mudando valores
    Sx <= '0';
    Sy <= '0';
    Scin <= '1';

    --esperando 1 ciclo
    Sx <= '1';
    Sy <= '1';
    Scin <= '1';
    wait;
    end process;
end architecture;



