entity tb_mux2x8 is 
end entity;
architecture comutacao of tb_mux2x8 is
    component mux2x8 is
        port(
            canal0: in bit_vector(7 downto 0);
            canal1: in bit_vector(7 downto 0);
            seletor: in bit;
            --1 saída Z para 8 MUX2x1
            Zc : out bit_vector(7 downto 0)

        );
    end component;
    --declaracão dos sinais  
    signal Scanal0 : bit_vector(7 downto 0);
    signal Scanal1 : bit_vector(7 downto 0);
    signal Sseletor : bit;
    signal Szc : bit_vector(7 downto 0);

begin 
    u_mux2x8 : mux2x8 port map (
        Scanal0,
        Scanal1,
        Sseletor,
        SZc --Canal de saida
    );
    u_tb: process
    begin
        Scanal0 <= "00000011";
        Scanal1 <= "11111100";
        Sseletor <= '0';
        wait for 10 ns;
        Sseletor <= '1';
        wait for 10 ns;
        wait;
    end process;
end architecture;