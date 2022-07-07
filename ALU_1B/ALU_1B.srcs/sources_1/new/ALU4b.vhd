library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use work.paqueteALU.ALL;

entity ALU4b is
    Port ( a,b,aluop : in STD_LOGIC_VECTOR (3 downto 0);
           res : inout STD_LOGIC_VECTOR (3 downto 0);
           cout,bandera_c,bandera_z,bandera_n,bandera_ov : inout STD_LOGIC);
end ALU4b;

architecture Behavioral of ALU4b is
signal c: std_logic_vector(4 downto 0);
begin
    --aluop(3): aInvert, aluop(2):bInvert, aluop(1): op(1), aluop(0):op(0)
    c(0) <= aluop(2);
    ciclo: for i in 0 to 3 generate
        elemento1: ALU1
        Port map(
            a => a(i),
            b => b(i),
            cin => c(i),
            aInvert => aluop(3),
            bInvert => aluop(2),
            op =>aluop(1 downto 0),
            res => res(i),
            cout => c(i+1)
        );
    end generate;
    cout<=c(4);
    bandera_c<=c(4);
    bandera_z<= '1' when res=0 else '0';
    bandera_n<= res(3);
    bandera_ov<= c(4) xor c(3);
    
end Behavioral;
