library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity elemento is
    generic(
        p:integer:=5;
        d:integer:=8
    );
    Port ( dirw, dirR : in STD_LOGIC_VECTOR (p-1 downto 0);
           datoIn : in STD_LOGIC_VECTOR (d-1 downto 0);
           clk,clr, wd : in STD_LOGIC;
           dataOut : out STD_LOGIC_VECTOR (d-1 downto 0));
end elemento;

architecture Behavioral of elemento is
type aux is array(0 to (2**p)-1) of std_logic_vector(d-1 downto 0);
signal caja:aux;
begin
process(clk)
begin
    --if(clr='1') then
        --caja <= (others =>(others=>'0'));
    if(rising_edge(clk)) then
        if(wd='1') then
            caja(conv_integer(dirw)) <= datoIn;
        else
            dataOut <= caja(conv_integer(dirR));
        end if;
    end if;
end process;
end Behavioral;
