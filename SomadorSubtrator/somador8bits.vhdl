library ieee;
use ieee.std_logic_1164.all;

entity somador8bits is
    port(
        --Entradas e saídas do Somador
        x : in std_logic_vector (7 downto 0);
        y : in std_logic_vector (7 downto 0);
        op : in std_logic; --Representa o Cin do Somador
        s : out std_logic_vector (7 downto 0); --Saída
        Cout_geral : out std_logic;
        overflow: out std_logic
    );
end entity;

architecture comportamento of somador8bits is
    --Componente Somador completo
    component somadorCompleto is
        port (x,y,Cin : in std_logic;
        s,cout : out std_logic);
    end component;

    --Componente MUX 8x2
    component mux2x8 is
        port(
            canal0: in std_logic_vector(7 downto 0);
            seletor: in std_logic;
            --Saída de Y negado
            canal1: out std_logic_vector(7 downto 0);
            --1 saída Z para 8 MUX2x1
            Zc : out std_logic_vector(7 downto 0)
        );
    end component;

    --SINAIS MUX 2x8
    --Convertendo std_logic para bit_vector
    signal s_mux_out : std_logic_vector(7 downto 0);
    signal s_seletor : std_logic;
    signal s_canal1 : std_logic_vector(7 downto 0);

   --SINAIS SOMADOR 8 BITS
    signal s_carry : std_logic_vector (7 downto 0);
    signal s_overflow : std_logic;
    signal s_overflow2comp : std_logic;
    
    begin
        --Retorna Y negado ou Y dependendo do sinal op
        u_mux2x8 : mux2x8 port map(y,op, s_canal1,s_mux_out);
        --Realiza Soma de 8 bits com o sinal de saída do MUX2x8
        u_somador0: somadorCompleto port map (x(0), s_mux_out(0),op,s(0),s_carry(0));
        u_somador1: somadorCompleto port map (x(1), s_mux_out(1),s_carry(0),s(1),s_carry(1));
        u_somador2: somadorCompleto port map (x(2), s_mux_out(2), s_carry(1), s(2), s_carry(2));
        u_somador3: somadorCompleto port map (x(3), s_mux_out(3), s_carry(2), s(3), s_carry(3));
        u_somador4: somadorCompleto port map (x(4), s_mux_out(4), s_carry(3), s(4), s_carry(4));
        u_somador5: somadorCompleto port map (x(5), s_mux_out(5), s_carry(4), s(5), s_carry(5));
        u_somador6: somadorCompleto port map (x(6), s_mux_out(6), s_carry(5), s(6), s_carry(6));
        u_somador7: somadorCompleto port map (x(7), s_mux_out(7), s_carry(6), s(7), s_carry(7));
        --s_overflow recebe o Cout_geral
        s_overflow <= s_carry(7);
        Cout_geral <= s_carry(7);

        --Quando foi complemento de dois é realizado o xor entre Cin e Cout
        s_overflow2comp <= s_carry(6) xor s_carry(7); --after 4 ns;

        --Caso for Soma o sinal do cout_geral é passado para o overflow
        --Caso seja Subtração o overflow é o XOR entre o Cout da ultima soma e o cout_geral
        overflow <= s_overflow when op = '0' else s_overflow2comp;
end architecture;


    
