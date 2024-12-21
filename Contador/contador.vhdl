library ieee;
use ieee.std_logic_1164.all;

entity contador is
    port(
        clk: in std_logic;
        reset: in std_logic;
        pr: in std_logic;
        q_cont : out std_logic_vector(2 downto 0);

    );
end entity;

architecture contador3bits of contador is
    component controler is
        port(
            q : in std_logic_vector (2 downto 0);
            j,k : out std_logic_vector (2 downto 0);
            
        );
    end component;

    signal sj,sk: std_logic_vector (2 downto 0);
    signal sq: std_logic_vector (2 downto 0);

    begin

        u_controle : controler port map(sj,sk,sq);
        --COMPORTAMENTO FFJKs
        u_ffjk0 : ffjk port map(sj(2),sk(2),clock,pr,reset,sq(2))
        u_ffjk1 : ffjk port map(sj(1),sk(1),clock,pr,reset,sq(1))
        u_ffjk2 : ffjk port map(sj(0),sk(0),clock,pr,reset,sq(0))
        q_cont <= sq;

end architecture