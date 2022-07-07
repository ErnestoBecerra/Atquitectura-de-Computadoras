library ieee;
library std;
use ieee.std_logic_textio.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use std.textio.all;
entity data_tb is
--  Port ( );
end data_tb;
architecture Behavioral of data_tb is
    component data_memory port(
        dirW: in  std_logic_vector( 15 downto 0 );
        dirR : in  std_logic_vector( 15 downto 0 );
        data_bus : in  std_logic_vector( 15 downto 0 );
        output : out  std_logic_vector( 15 downto 0 );
        clock : in  std_logic;
        wd : in  std_logic );
    end component;

    --Entradas
    signal dirW : std_logic_vector( 15 downto 0 ) := ( others => '0' );
    signal dirR : std_logic_vector( 15 downto 0 ) := ( others => '0' );
    signal data_bus : std_logic_vector( 15 downto 0 ) := ( others => '0' );
    signal clock : std_logic := '0';
    signal wd : std_logic := '0';

 	--Salidas
    signal output : std_logic_vector( 15 downto 0 );

    -- Clock period definitions
    constant clock_period : time := 10 ns;

begin
   uut: data_memory port map(
          dirW => dirW,
          dirR => dirR,
          data_bus => data_bus,
          output => output,
          clock => clock,
          wd => wd
        );
   --Reloj
   clock_process : process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
   --Estimulos
   file_sim : process
		file file_vectors : text;
		variable line_vector : line;
		variable var_data_bus : std_logic_vector( 15 downto 0 ); -- Data in.
		variable var_addr : std_logic_vector( 15 downto 0 ); -- Address bus.
		variable var_wd : std_logic;

		file file_results : text;
		variable line_result : line;
		variable var_output : std_logic_vector( 15 downto 0 ); -- Data out.
		variable str : string( 1 to 18 );

		begin
			file_open( file_vectors, "Vectors.txt", read_mode );
			file_open( file_results, "Results.txt", write_mode );

			str := "               add";
			write( line_result, str, right, str'length + 1 );
			str := "                WD";
			write( line_result, str, right, str'length + 1 );
			str := "            dataIn";
			write( line_result, str, right, str'length + 1 );
			str := "           dataOut";
			write( line_result, str, right, str'length + 1 );
			writeline( file_results, line_result );

			wait for 100 ns;

			for i in 0 to 11 loop
			    
				readline ( file_vectors, line_vector );
				read( line_vector, var_wd );
				wd <= var_wd;
				hread( line_vector, var_addr );
				dirW <= var_addr;
				hread( line_vector, var_data_bus );
				data_bus <= var_data_bus;

				wait until rising_edge ( clock );

				dirR <= var_addr;
				var_output := output;
				hwrite( line_result, var_addr, right, 19 );
				write( line_result, var_wd, right, 19 );
				hwrite( line_result, var_data_bus, right, 19 );
				hwrite( line_result, var_output, right, 19 );

				writeline ( file_results, line_result );
			end loop;

			file_close ( file_vectors );
			file_close ( file_results );
		wait;
	end process;
end Behavioral;
