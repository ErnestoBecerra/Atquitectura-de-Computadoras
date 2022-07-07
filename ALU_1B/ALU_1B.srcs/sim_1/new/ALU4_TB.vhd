library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
entity ALU4_TB is
--  Port ( );
end ALU4_TB;
architecture Behavioral of ALU4_TB is
    component ALU4b 
        Port ( a,b,aluop : in STD_LOGIC_VECTOR (3 downto 0);
               res : inout STD_LOGIC_VECTOR (3 downto 0);
               cout,bandera_c,bandera_z,bandera_n,bandera_ov : inout STD_LOGIC);
    end component;
    signal a,b,aluop : STD_LOGIC_VECTOR (3 downto 0);
    signal res : STD_LOGIC_VECTOR (3 downto 0);
    signal cout,bandera_c,bandera_z,bandera_n,bandera_ov : STD_LOGIC;
begin
    practica4: ALU4b Port map(
    a => a,
    b => b,
    aluop => aluop,
    res => res,
    cout => cout,
    bandera_c => bandera_c,
    bandera_z => bandera_z,
    bandera_n => bandera_n,
    bandera_ov => bandera_ov);
stimulus: process
begin
    a<="0101";
    b<="1110";
    aluop<="0011";
    wait for 20ns;
    
    a<="0101";
    b<="1110";
    aluop<="0111";
    wait for 20ns;
    
    a<="0101";
    b<="1110";
    aluop<="0100";
    wait for 20ns;
    
    a<="0101";
    b<="1110";
    aluop<="1101";
    wait for 20ns;
    
    a<="0101";
    b<="1110";
    aluop<="0001";
    wait for 20ns;
    
    a<="0101";
    b<="1110";
    aluop<="1100";
    wait for 20ns;
    
    a<="0101";
    b<="1110";
    aluop<="0010";
    wait for 20ns;
    
    a<="0101";
    b<="1110";
    aluop<="0100";
    wait for 20ns;
    
    a<="0101";
    b<="0111";
    aluop<="0011";
    wait for 20ns;
    
    a<="0101";
    b<="0101";
    aluop<="0111";
    wait for 20ns;
    
    a<="0101";
    b<="0101";
    aluop<="1101";
    wait for 20ns;
    wait;
 end process;
end Behavioral;
