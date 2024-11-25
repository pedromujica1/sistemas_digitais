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
        t_ffjkD: process

        begin
            spr <= '1';
            scl <= '0';
            sD <= '0';
            -- desativação de clear
            wait for CLK_PERIOD;
            scl <= '1';
            sD  <= '1';
            wait for CLK_PERIOD;
            sD  <= '0';
            wait for CLK_PERIOD;
            sD  <= '1';
            wait for CLK_PERIOD;
            sD  <= '0';
            wait for CLK_PERIOD;
            sD  <= '1';
            wait for CLK_PERIOD;
        
            spr <= '1';
            scl <= '1';
            sD <= '1';
            wait for CLK_PERIOD;
            -- alteração de J e K
            
        
            end process;
            -- process para Clock
            p_clock : process
            begin
            sclk <= not(sclk);
            wait for CLK_PERIOD/2;
            end process;
    end architecture testeClock;
