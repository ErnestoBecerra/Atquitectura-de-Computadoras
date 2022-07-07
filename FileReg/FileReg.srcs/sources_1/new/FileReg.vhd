library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity FileReg is
    Port ( writeReg, readReg1,readReg2,shamt : in STD_LOGIC_VECTOR (3 downto 0);
           writeData : in STD_LOGIC_VECTOR (15 downto 0);
           clk,clr,wr,she,dir : in STD_LOGIC;
           readData1,readData2 : out STD_LOGIC_VECTOR (15 downto 0));
end FileReg;

architecture Behavioral of FileReg is
type palabra is array (0 to 15) of std_logic_vector(writeData'length-1 downto 0);
signal banco: palabra;
begin
    process(clk,clr)
    variable aux,res: STD_LOGIC_VECTOR(15 downto 0) := (others=>'0');
    variable num: integer;
    variable tope: integer := 16;
    begin
        if(clr='1')then
            banco <= (others=>(others=>'0'));
        elsif(rising_edge(clk))then
        --Escribir
        if(wr='1' and she='0')then --Cargar
            banco(conv_integer(writeReg)) <= writeData;
        elsif (wr='1' and she='1' and dir='0')then
            aux := banco(conv_integer(readReg1));
            res := banco(conv_integer(writeReg));
            for i in 0 to shamt'length-1 loop
                num := 2**i; -- 2 elevado a la i
                for j in 0 to tope-num-1 loop
                    if(shamt(i)='1')then
                        res(j) := aux(j+num);
                    end if;
                end loop;
                 for j in tope-num to tope-1 loop
                    if(shamt(i)='1')then
                        res(j) := '0';
                    end if;
                 end loop;
                 aux := res;
            end loop;
            banco(conv_integer(writeReg))<=res;
        elsif (wr='1' and she='1' and dir='1')then
            aux := banco(conv_integer(readReg1));
            res := banco(conv_integer(readReg1));
            for i in 0 to shamt'length-1 loop
                num := 2**i; -- 2 elevado a la i
                for j in 0 to num-1 loop
                    if(shamt(i)='1')then
                        res(j):='0';
                    end if;
                end loop;
                for j in num to tope-1 loop
                    if(shamt(i)='1')then
                        res(j):=aux(j-num);
                    end if;
                end loop;
                aux := res;
            end loop;
                banco(conv_integer(writeReg)) <= res;
            end if;
        end if;
    end process;
    readData1 <= banco(conv_integer(readReg1));
    readData2 <= banco(conv_integer(readReg2));
end Behavioral;

