library ieee;
use ieee.std_logic_1164.all;

entity ffjkT is
port(
    t : in std_logic;
    clockT : in std_logic;
    prT, clT : in std_logic;
    qT, nqT : out std_logic
);
end ffjkT;
architecture ffT of ffjkT is
    --Sinais de saída
    signal s_T: std_logic; 
    signal q_ffjkT : std_logic;
    signal nq_ffjkT : std_logic;
    --Componente ffjk
    component ffjk is
        port(
            j, k : in std_logic;
            clock : in std_logic;
            pr, cl : in std_logic;
            q, nq : out std_logic
        );
    end component;
    
    begin
        s_notD <= not d;
        u_ffjkD : ffjk port map(t,t,clockT,prT,clT,q_ffjkT,nq_ffjkT);
        qT <= q_ffjkT;
        nqT <= nq_ffjkT;
    end architecture;


