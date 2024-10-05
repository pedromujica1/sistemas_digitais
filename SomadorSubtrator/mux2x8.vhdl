
entity mux2x8 is
    port (
        --Canais de 8 MUX 2x1 
        canal0: in bit_vector(7 downto 0);
        canal1: in bit_vector(7 downto 0);
        seletor: in bit;
        --1 saída Z para 8 MUX2x1
        Zc : out bit_vector(7 downto 0)
    ); 
end entity mux2x8;

architecture comutacao of mux2x8 is
    begin
        --Definindo o comoportamento do MUX2X8
        Zc <= canal0 when seletor = '0' else canal1;
end architecture;