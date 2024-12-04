library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
    port (
        --Canais de 8 MUX 2x1 
        canal0: in std_logic; --Entra o Y
        seletor: in std_logic;
        canal1: out std_logic; --Saída do componente not8bits = ~Y 
        --1 saída Z para 8 MUX2x1
        Zc : out std_logic;
    ); 
end entity mux2x1;

architecture comutacao of mux2x8 is

    component not8bits is
        port(
            y: in std_logic_vector (7 downto 0);
            not_y : out std_logic_vector (7 downto 0)
        );
    end component;

    signal s_notY: std_logic_vector(7 downto 0);
    begin
        --Negação da palavra Y e colocando o ~ Y no canal 1
        u_not8bits : not8bits port map(canal0,s_notY);
        canal1 <= s_notY;

        --Definindo comportamento do MUX
        --Quando SELECT = 0 comutar canal 0
        --Quando SELECT = 1 comutar canal 1
        Zc <= canal0 when seletor = '0' else s_notY;
end architecture;