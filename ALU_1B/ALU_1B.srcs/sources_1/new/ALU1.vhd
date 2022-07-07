library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU1 is
    Port ( a,b,aInvert,bInvert,cin : in STD_LOGIC;
           op : in STD_LOGIC_VECTOR (1 downto 0);
           cout,res : out STD_LOGIC);
end ALU1;

architecture Behavioral of ALU1 is
signal auxa, auxb, auxAND, auxOR, aux_XOR, auxSUMA, auxcout: std_logic;
begin
    auxa <= a when aInvert='0' else not a;
    auxb <= b xor bInvert;
    
    auxAND <= auxa and auxb;
    auxOR <= auxa or auxb;
    aux_XOR <= auxa xor auxb;
    auxSUMA <= auxa xor auxb xor cin;
    auxcout <= (auxa and cin) or  (auxa and auxb) or (auxb and cin);
    
    res <= auxAND when op="00" else
           auxOR when op="01"  else
           aux_XOR when op="10" else
           auxSUMA;

    cout <= auxcout when op="11" else '0';
end Behavioral;
