
entity not8bits is
    port(
        b: in bit_vector (7 downto 0);
        not_b: out bit_vector ( 7 downto 0)
    );

end entity;
architecture negacao8bits of not8bits is
    begin
        --Definindo negação dos bits
        not_b <= not b;
    end architecture;
        