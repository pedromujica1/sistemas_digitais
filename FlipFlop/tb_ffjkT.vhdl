library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjkT is
end entity;
architecture testeClock of tb_ffjkT is
    constant CLK_PERIOD : time := 20 ns;
    component ffjkT is
        port(
            t : in std_logic;
            clockT : in std_logic;
            prT, clT : in std_logic;
            qT, nqT : out std_logic
        );
    end component;
    --Declarando sinais
    signal sT, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

    begin
        u_ffjkT : ffjkT port map(sT,sclk,spr,scl,sq,snq);
        t_ffjkT: process

        begin
            spr <= '1';
            scl <= '0';
            sT <= '0';
            -- desativação de clear
            wait for CLK_PERIOD;
            scl <= '1';
            sT  <= '1';
            wait for CLK_PERIOD;
            sT  <= '0';
            wait for CLK_PERIOD;
            sT  <= '1';
            wait for CLK_PERIOD;
            sT  <= '0';
            wait for CLK_PERIOD;
            sT  <= '1';
            wait for CLK_PERIOD;
        
            spr <= '1';
            scl <= '1';
            sT <= '1';
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
