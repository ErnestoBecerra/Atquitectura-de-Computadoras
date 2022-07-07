library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity sumador_anticipado is
    Port ( a,b : in STD_LOGIC_VECTOR (0 to 7);
           S : out STD_LOGIC_VECTOR (0 to 7);
           Cout : out STD_LOGIC);
end sumador_anticipado;
 
architecture Behavioral of sumador_anticipado is
variable P: std_logic_vector(7 downto 0);
variable G: std_logic_vector(7 downto 0);
variable c: std_logic_vector(8 downto 0);
variable p1: std_logic;
variable p2: std_logic;
variable p3: std_logic;
variable suma: std_logic;
begin
    for i in 0 to 8-1 loop
        P(i) := a(i) xor b(i);
        G(i) := a(i) and b(i);
        S(i) <= P(i) xor c(i);
        p1 := c(0);
        for j in 0 to i loop
            p1 := p1 and P(j);
        end loop;
        
        suma := '0';
        for k in 0 to i-1 loop
            P(0) := G(i);
            p2 := '1';
            for m in (k+1) to i loop
                p2 := p2 and P(m);
            end loop;
            p3 := G(k) and p2;
            suma := suma or p3;
       end loop;
       c(i+1) := (p1 or suma) or G(i);
   end loop,    
     Cout <= c(8)
end Behavioral;
