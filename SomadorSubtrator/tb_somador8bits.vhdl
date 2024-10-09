library ieee;
use ieee.std_logic_1164.all;

entity tb_somador8bits is 
end entity;

architecture comportamento of tb_somador8bits is
    component somador8bits is
        port(x : in std_logic_vector (7 downto 0);
            y : in std_logic_vector (7 downto 0);
            op : in std_logic; 
            s : out std_logic_vector (7 downto 0);
            Cout_geral : out std_logic
        );
            
    end component;
    --declarando sinais
    signal s_x : std_logic_vector (7 downto 0);
    signal s_y : std_logic_vector (7 downto 0);
    signal Cin_geral : std_logic;
    signal s_saida:  std_logic_vector (7 downto 0);
    signal Cout_geral :  std_logic;

    begin
        u_somador8bits : somador8bits port map (s_x,s_y,Cin_geral,s_saida,Cout_geral);
        u_tb : process
        begin
            
            -- Caso 3: 0xFF + 0x01
            -- Caso 4: 0xFF - 0x01
            -- Caso 5: 0xFE + 0xFE
            -- Caso 6: 0xFF + 0xFF

            --Caso 1: 0x00 + 0xFF
            s_x <= "00000000";
            s_y <= "11111111";
            Cin_geral <= '0';
            wait for 10 ns;
            --Caso 2: 0x00 - 0xFF 
            Cin_geral <= '1';
            wait for 10 ns;
            --Caso 3: 0xFF - 0x01 
            s_x <= "11111111";
            s_y <= "00000001";
            Cin_geral <= '0';
            wait for 10 ns;
            --Caso 4: 0xFF – 0x01
            Cin_geral <= '1';
            wait for 10 ns;
            --Caso 5: 0xFE + 0xFE
            s_x <= "11111110";
            s_y <= "11111110";
            Cin_geral <= '0';
            wait for 10 ns;
            --Caso 6: 0xFF + 0xFF
            s_x <= "11111111";
            s_y <= "11111111";
            Cin_geral <= '0';
            wait for 10 ns;
            --Caso 7
            s_x <= "00000111";
            s_y <= "11111111";
            Cin_geral <= '0';
            wait for 10 ns;
            
        
            wait;
        end process;
    end architecture;