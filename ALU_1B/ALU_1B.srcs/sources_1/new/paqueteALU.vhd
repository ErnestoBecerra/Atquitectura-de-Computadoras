library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteALU is
    component ALU1 is
        Port(a,b,aInvert,bInvert,cin: in STD_LOGIC;
            op: in STD_LOGIC_VECTOR(1 downto 0);
            cout,res: out STD_LOGIC);
    end component;
end package;