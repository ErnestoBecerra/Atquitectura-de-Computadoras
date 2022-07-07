library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumadorTB is
--  Port ( );
end sumadorTB;

architecture Behavioral of sumadorTB is
component sumador4b is
    Port ( a,b : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end component;

signal a,b :  STD_LOGIC_VECTOR (3 downto 0);
signal sel :  STD_LOGIC;
signal S :  STD_LOGIC_VECTOR (3 downto 0);
signal cout :  STD_LOGIC; 

begin 
unidad1:  sumador4b
    Port map( 
        a => a,
        b => b,
            sel => sel,
            S => S,
            cout => cout
    );
process
begin 
    a <= "0110"; 
    b <= "0111";
    sel <= '0';
    wait for 20 ns;
    
    sel <= '0';    
    a <= "0110";
    b <= "1001";
    wait for 20 ns;
    
    sel <= '0';    
    a <= "0100";
    b <= "1001";
    wait for 20 ns;
    
    sel <= '1';    
    a <= "1111";
    b <= "0001";
    wait for 20 ns;
    
    sel <= '0';    
    a <= "0011";
    b <= "1010";
    wait for 20 ns;
    
    sel <= '1';    
    a <= "1100";
    b <= "0101";
    wait for 20 ns;
    
    sel <= '1';    
    a <= "1110";
    b <= "1000";
    
    sel <= '1';    
    a <= "1010";
    b <= "0110";
    wait for 20 ns;
    
    sel <= '1';    
    a <= "1001";
    b <= "0100";
    wait;
end process;
end Behavioral;
