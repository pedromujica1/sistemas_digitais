entity tb_not8bits is
end entity;

architecture negacao of tb_not8bits is

    component not8bits is
        port(
            b: in bit_vector (7 downto 0);
            not_b : out bit_vector (7 downto 0)
        );
    end component;
    --Declarando os sinais 
    signal s_inB: bit_vector (7 downto 0);
    signal s_notB: bit_vector (7 downto 0);

begin
    --Conversão do bit_vector para outro tipo de dado (bit)
    u_not8bits : not8bits port map(s_inB,s_notB);
    u_tb : process
    begin
        s_inB <= "01010101"; --atribuindo um valor inicial para o in8bits
        wait for 10 ns;
        s_inB <= "00000000"; --atribuindo um val
        wait for 10 ns;
        wait;
    end process;

end architecture;
    





