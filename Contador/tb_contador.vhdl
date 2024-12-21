library ieee;
use ieee.std_logic_1164.all;

entity tb_contador
end entity

architecture contar of tb_contador
    
    --constante clock 
    constant CLK_PERIOD : time := 20 ns;

    component contador is
        port(
            clk: in std_logic;
            reset in std_logic;
            clear in std_logic;
            q_cont : out std_logic_vector(2 downto 0);
    
        );
    end component

    signal sj, sk, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';
    signal s_qcont : std_logic_vector (2 downto 0);
    begin
    --instancia de JK e port map
        u_ffjk: ffjk port map(sj,sk,sclk,spr,scl,sq,snq);
    --process
    end architecture
    

        