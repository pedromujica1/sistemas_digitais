library ieee;
use ieee.std_logic_1164.all;


entity somador8bits is
    port(x,y: in std_logic_vector (7 downto 0);
    cin : in std_logic;
    s : out std_logic_vector (7 downto 0);
    cout : out std_logic); 
end entity;

architecture comportamento of somador8bits is
    component somadorCompleto
        port (x,y,cin : in std_logic;
        s,cout : out std_logic);
    end component;
    signal carry : STD_LOGIC_VECTOR (6 downto 0);

    begin
        u_somador0: somadorCompleto port map (x(0), y(0),cin,s(0),carry(0));
        u_somador1: somadorCompleto port map (x(1), y(1),carry(0),s(1),carry(1));
        u_somador2: somadorCompleto port map (x(2), y(2), carry(1), s(2), carry(2));
        u_somador3: somadorCompleto port map (x(3), y(3), carry(2), s(3), carry(3));
        u_somador4: somadorCompleto port map (x(4), y(4), carry(3), s(4), carry(4));
        u_somador5: somadorCompleto port map (x(5), y(5), carry(4), s(5), carry(5));
        u_somador6: somadorCompleto port map (x(6), y(6), carry(5), s(6), carry(6));
        u_somador7: somadorCompleto port map (x(7), y(7), carry(6), s(7), cout);


    
