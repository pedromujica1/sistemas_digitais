library ieee;
use ieee.std_logic_1164.all;

entity tb_contador
end entity

architecture contar of tb_contador
    
    --constante clock 
    constant CLK_PERIOD : time := 20 ns;

    component contador is
        port(
            clk, reset, pr: in std_logic;
            q_cont : out std_logic_vector(2 downto 0);
    
        );
    end component

    component controler is
        port(
            q : in std_logic_vector (2 downto 0);
            j,k : out std_logic_vector (2 downto 0);
            
        );
    end component;

    signal spr, scl, sreset : std_logic;
    signal sclk : std_logic := '1';
    signal s_qcont : std_logic_vector (2 downto 0);
    
    contador_u:contador port map (sclk, sreset, spr, s_qcout) 

    u_contador: process 
    begin 
    spr <= '1';
    sreset <= '0';
    wait for CLK_PERIOD; 
    sreset <= '1';
    wait for CLK_PERIOD; 
    end process
    p_clock_n : process
        begin
            s_clk <= not(s_clk);
            wait for CLK_PERIOD/2;
        end process;
    end architecture
    

        
