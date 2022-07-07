library ieee;
library STD;
use ieee.STD_LOGIC_1164.ALL;
use ieee.STD_LOGIC_arith.all;
use ieee.STD_LOGIC_unsigned.ALL;
use ieee.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;
entity tb_programMem is
--  Port ( );
end tb_programMem;

architecture Behavioral of tb_programMem is
component program_memory is 
    port (
		addr_bus : in std_logic_vector ( 9 downto 0 );
		output : out std_logic_vector ( 24  downto 0 ));
end component;
signal addr_bus: std_logic_vector(9 downto 0) := "0000000000";
signal output: std_logic_vector(24 downto 0);
begin 
    mp : program_memory Port map(
        addr_bus => addr_bus,
        output => output
    );
    process
        file arch_res : text;										
        variable linea_res : line;
        variable var_inst : STD_LOGIC_VECTOR (24 downto 0);
        variable cadena : string (1 to 6);
    begin
        --- PC OPCODE 19..16 15..12 11..8 7..4 3..0
        file_open (arch_res, "Resultados.txt", write_mode);	
        
        cadena := "PC    ";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "PC"
        cadena := "OPCODE";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "OPCODE"
        cadena := "19..16";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "19..16"
        cadena := "15..12";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "15..12"
        cadena := " 11..8";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "11..8"
        cadena := "  7..4";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "7..4"
        cadena := "  3..0";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "3..0"
        
        writeline(arch_res, linea_res);-- escribe la linea en el archivo

        for i in 0 to 11 loop
            wait for 10 ns;
            var_inst := output;
            
            Hwrite(linea_res, addr_bus, left, 9);--ESCRIBE EL CAMPO PC
            write(linea_res, var_inst(24 downto 20), left, 8);--ESCRIBE EL CAMPO OPCODE
            write(linea_res, var_inst(19 downto 16), left, 7);--ESCRIBE EL CAMPO 19..16
            write(linea_res, var_inst(15 downto 12), left, 7);--ESCRIBE EL CAMPO 15..12
            write(linea_res, var_inst(11 downto 8), left, 7);--ESCRIBE EL CAMPO 11..8
            write(linea_res, var_inst(7 downto 4), left, 7);--ESCRIBE EL CAMPO 7 .. 4
            write(linea_res, var_inst(3 downto 0), left, 7);--ESCRIBE EL CAMPO 3 .. 0
            
            writeline(arch_res, linea_res);
            addr_bus <= addr_bus + 1;
        end loop;
        file_close(arch_res);  -- cierra el archivo
        wait;
    end process;
end Behavioral;
