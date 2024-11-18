library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjkD is
end entity;
architecture testeClock of tb_ffjkD is
    constant CLK_PERIOD : time := 20 ns;
    component ffjkD is
        port(
            d : in std_logic;
            clockD : in std_logic;
            prD, clD : in std_logic;
            qD, nqD : out std_logic
        );
    end component;
    --Declarando sinais
        signal sD, spr, scl, sq, snq : std_logic;
        signal sclk : std_logic := '1';

    begin
        u_ffjkD : ffjkD port map(sD,sclk,spr,scl,sq,snq);
        t_ffjkD: process;

        begin
