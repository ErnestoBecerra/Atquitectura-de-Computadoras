library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity data_memory is generic( n : integer := 16 );
    port (
		dirW, dirR : in std_logic_vector( n - 1 downto 0 );
		data_bus : in std_logic_vector( n - 1 downto 0 );
		output : out std_logic_vector( n - 1 downto 0 );
		clock, wd : in std_logic
	);
end data_memory;

architecture Behavioral of data_memory is

type ram_memory is array( 0 to 2**n ) of std_logic_vector( n - 1 downto 0 );
	signal memory : ram_memory;

	begin

		process( clock )
		begin
			if ( clock'event and clock = '1' ) then
				if ( wd = '1' ) then
					memory( conv_integer( dirW ) ) <= data_bus;
				end if;
			end if;
		end process;

		output <= memory( conv_integer( dirR ) );


end Behavioral;
