library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not8bits is
    port(
        y: in std_logic_vector (7 downto 0);
        not_y: out std_logic_vector ( 7 downto 0)
    );

end entity;
architecture negacao8bits of not8bits is
    begin
        process(y)
        begin
            --Definindo negação dos bits
            not_y <= not y;
            
        
        end process;
    end architecture;
        