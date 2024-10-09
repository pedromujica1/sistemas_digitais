library ieee;
use ieee.std_logic_1164.all;

entity tb_not8bits is
end entity;

architecture negacao of tb_not8bits is

    component not8bits is
        port(
            y: in std_logic_vector (7 downto 0);
            not_y : out std_logic_vector (7 downto 0)
        );
    end component;
    --Declarando os sinais 
    signal s_inY: std_logic_vector (7 downto 0);
    signal s_notY: std_logic_vector (7 downto 0);

begin
    
    u_not8bits : not8bits port map(s_inY,s_notY);
    u_tb : process
    begin
        s_inY <= "01010101"; --atribuindo um valor inicial para o in8bits
        wait for 10 ns;
        s_inY <= "00000000"; --atribuindo um val
        wait for 10 ns;
        wait;
    end process;

end architecture;
    





