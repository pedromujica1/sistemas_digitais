library ieee;
use ieee.std_logic_1164.all;

entity tb_regcarga8bits is
end entity;
 
architecture reg8bits of tb_regcarga8bits is
    constant CLK_PERIOD : time := 20 ns;
    component regcarga8bits is
        port(
        d : in std_logic_vector (7 downto 0);
        clk : in std_logic;
        pr, cl : in std_logic;
        nrw : in std_logic;
        s : out std_logic_vector (7 downto 0)
        );
    end component;
    signal s_d : std_logic_vector (7 downto 0);
    signal s_pr,s_cl,s_nrw : std_logic;
    signal s_s : std_logic_vector (7 downto 0);
    signal s_clk : std_logic := '1';
    begin
    u_regc : regcarga8bits port map(s_d,s_clk,s_pr,s_cl,s_nrw,s_s);
    u_tb : process
           begin
--caso 0
                s_nrw <= '0';
                s_pr <= '0';
                s_cl <= '1';
                s_d  <= "00000000";
wait for CLK_PERIOD;
--caso 1
                s_nrw <= '1';
                s_pr <= '1';
                s_cl <= '1';
                s_d <=  "00001111" ;
wait for CLK_PERIOD;
--caso 2
                s_nrw <= '0';
                s_pr <= '1';
                s_cl <= '1';
                s_d  <= "11111111";
wait for CLK_PERIOD;
        end process;

p_clock_n : process
        begin
            s_clk <= not(s_clk);
            wait for CLK_PERIOD/2;
        end process;
end architecture;
