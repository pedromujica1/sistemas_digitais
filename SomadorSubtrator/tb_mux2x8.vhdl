library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux2x8 is 
end entity;
architecture comutacao of tb_mux2x8 is
    component mux2x8 is
        port(
            canal0: in std_logic_vector(7 downto 0);
            seletor: in std_logic;
            --Saída de Y negado
            canal1: out std_logic_vector(7 downto 0);
            --1 saída Z para 8 MUX2x1
            Zc : out std_logic_vector(7 downto 0)

        );
    end component;
    
    --declaracão dos sinais  
    signal Scanal0 : std_logic_vector(7 downto 0);
    signal Scanal1 : std_logic_vector(7 downto 0);
    signal Sseletor : std_logic;
    signal Szc : std_logic_vector(7 downto 0);

begin 
    u_mux2x8 : mux2x8 port map (
        Scanal0,
        Sseletor,
        Scanal1,
        SZc --Canal de saida
    );
    u_tb: process
    begin
        Scanal0 <= "00000011";
        Sseletor <= '0';
        wait for 10 ns;
        Sseletor <= '1';
        wait for 10 ns;
        wait;
    end process;
end architecture;