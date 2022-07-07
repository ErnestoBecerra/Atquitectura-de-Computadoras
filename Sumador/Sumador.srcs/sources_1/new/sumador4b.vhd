library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity sumador4b is
    Port ( a,b : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end sumador4b;
architecture Behavioral of sumador4b is
signal eb: std_logic_vector(3 downto 0);
signal c: std_logic_vector(4 downto 0);
begin
    c(0)  <= sel;
    cicle : for i in 0 to 3 generate
        eb(i) <= b(i) xor c(0);
        S(i) <= a(i) xor eb(i) xor c(i);
        c(i+1) <= (a(i) and eb(i)) or (a(i) and c(i)) or (eb(i) and c(i));
    end generate;
    cout <= c(4);
end Behavioral;
