library ieee;
use ieee.std_logic_1164.all;

entity tb_contador is
end entity;

architecture contar of tb_contador is
    
    --constante clock 
    constant CLK_PERIOD : time := 20 ns;

    component contador is
        port(
            clock_cont, reset_cont, pr_cont: in std_logic;
            q_cont : out std_logic_vector(2 downto 0)
    
        );
    end component;


    
    begin
        
        signal spr, sreset : std_logic;
        signal sclk : std_logic := '1';
        signal s_qcont : std_logic_vector (2 downto 0);
        contador_u: contador port map (sclk, sreset, spr, s_qcont); 
        u_contador: process 
        begin
            spr <= '1';
            sreset <= '0';
            wait for CLK_PERIOD; 
            sreset <= '1';
            wait for CLK_PERIOD;
            wait; -- Finaliza o processo
        
        end process;
    p_clock_n : process
    begin
       
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;
end architecture;
    

        
