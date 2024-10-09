library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x8 is
    port (
        --Canais de 8 MUX 2x1 
        canal0: in std_logic_vector(7 downto 0);
        seletor: in std_logic;
        --Saída de Y negado
        canal1: out std_logic_vector(7 downto 0);
        --1 saída Z para 8 MUX2x1
        Zc : out std_logic_vector(7 downto 0)
    ); 
end entity mux2x8;

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

        process (canal0,seletor,s_notY)
        begin
            if seletor = '0' then
                Zc <=canal0;
            else
                Zc <=s_notY; 
            end if;
            --Zc <= canal0 when seletor = '0' else s_notY;
        end process;
        --Definindo o comoportamento do MUX2X8
        --Zc <= canal0 when seletor = '0' else s_notY;
end architecture;