library ieee;
use ieee.std_logic_1164.all;

--XOR DO CARRY_IN E CARRY_OUT

entity somador8bits is
    port(x : in std_logic_vector (7 downto 0);
        y : in std_logic_vector (7 downto 0);
        op : in bit;
        
        
        s : out std_logic_vector (7 downto 0);
        cout : out std_logic;
        Cin : in std_logic); 
end entity;

architecture comportamento of somador8bits is
    --Componente Somador completo
    component somadorCompleto
        port (x,y,Cin : in std_logic;
        s,cout : out std_logic);
    end component;
    --Componente MUX 8x2
    component mux2x8 is
        port(
            canal0: in bit_vector(7 downto 0);
            seletor: in bit;
            --Saída de Y negado
            canal1: out bit_vector(7 downto 0);
            --1 saída Z para 8 MUX2x1
            Zc : out bit_vector(7 downto 0)

        );
    end component;

    --SINAIS MUX 2x8
    --Convertendo std_logic para bit_vector
    signal s_carry : std_logic_vector(6 downto 0);  -- Sinais de carry intermediários
    
    signal y_mux_out : bit_vector(7 downto 0);    -- Saída do mux como bit_vector
    signal y_mux_out_std : std_logic_vector(7 downto 0); -- Saída do mux convertida para std_logic_vector
    signal carry : std_logic;  -- Carry inicial
    signal y_invertido : std_logic_vector(7 downto 0);
    
    begin
        y_bitv <= bit_vector(y);

        -- Instância do MUX 2x8 que seleciona entre y e ~y
        u_mux2x8 : mux2x8
        port map (
            y,
            op,            --Se 1, então ~Y e se for 0 então Y
            canal1  => y_invertido,  -- Se 'op' = 1, usa ~y
            Zc      => y_mux_out     -- Saída que vai para o somador
        );

        -- Inversão de y (complemento bit a bit)
        --y_invertido <= not y;

        -- Definição do carry-in (cin inicial): 0 para soma, 1 para subtração
        carry <= '0' when op = '0' else '1';

        --u_mux2x8 : mux2x8 port map (Y_bitV,op,s_canal1,s_SZc);
        --s_ZcSTD <= std_logic_vector(s_SZc);
        --y <= s_ZcSTD;
        --cin <=op;

        u_somador0: somadorCompleto port map (x(0), y_mux_out(0),carry,s(0),s_carry(0));
        u_somador1: somadorCompleto port map (x(1), y_mux_out(1),s_carry(0),s(1),s_carry(1));
        u_somador2: somadorCompleto port map (x(2), y_mux_out(2), s_carry(1), s(2), s_carry(2));
        u_somador3: somadorCompleto port map (x(3), y_mux_out(3), s_carry(2), s(3), s_carry(3));
        u_somador4: somadorCompleto port map (x(4), y_mux_out(4), s_carry(3), s(4), s_carry(4));
        u_somador5: somadorCompleto port map (x(5), y_mux_out(5), s_carry(4), s(5), s_carry(5));
        u_somador6: somadorCompleto port map (x(6), y_mux_out(6), s_carry(5), s(6), s_carry(6));
        u_somador7: somadorCompleto port map (x(7), y_mux_out(7), s_carry(6), s(7), cout);
end architecture;


    
