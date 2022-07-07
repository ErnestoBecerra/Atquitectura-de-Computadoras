library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity program_memory is 
    generic(m : integer := 10;
            n : integer := 25);
    port (
		addr_bus : in std_logic_vector ( m - 1 downto 0 );
		output : out std_logic_vector ( n - 1 downto 0 ));
end program_memory;
architecture Behavioral of program_memory is
    -- Instrucciones tipo R siempre deben ser '0'.
	constant TYPE_R : std_logic_vector( 4 downto 0 ) := "00000";
	-- Instrucciones tipo R
	constant ADD1 : std_logic_vector( 3 downto 0 ) := "0000"; 
	constant SUB1 : std_logic_vector( 3 downto 0 ) := "0001"; 
	constant AND1 : std_logic_vector( 3 downto 0 ) := "0010"; 
	constant OR1 : std_logic_vector( 3 downto 0 ) := "0011"; 
	constant XOR1 : std_logic_vector( 3 downto 0 ) := "0100"; 
	constant NAND1 : std_logic_vector( 3 downto 0 ) := "0101"; 
	constant NOR1 : std_logic_vector( 3 downto 0 ) := "0110"; 
	constant XNOR1 : std_logic_vector( 3 downto 0 ) := "0111"; 
	constant NOT1 : std_logic_vector( 3 downto 0 ) := "1000"; 
	constant SLL1 : std_logic_vector( 3 downto 0 ) := "1001"; 
	constant SRL1 : std_logic_vector( 3 downto 0 ) := "1010"; 
	-- Instrucciones tipo I
	constant LI : std_logic_vector( 4 downto 0 ) := "00001"; 
	constant LWI : std_logic_vector( 4 downto 0 ) := "00010";
	constant LW : std_logic_vector( 4 downto 0 ) := "10111"; 
	constant SWI : std_logic_vector( 4 downto 0 ) := "00011"; 
	constant SW : std_logic_vector( 4 downto 0 ) := "00100"; 
	constant ADDI : std_logic_vector( 4 downto 0 ) := "00101"; 
	constant SUBI : std_logic_vector( 4 downto 0 ) := "00110"; 
	constant ANDI : std_logic_vector( 4 downto 0 ) := "00111"; 
	constant ORI : std_logic_vector( 4 downto 0 ) := "01000"; 
	constant XORI : std_logic_vector( 4 downto 0 ) := "01001"; 
	constant NANDI : std_logic_vector( 4 downto 0 ) := "01010";
	constant NORI : std_logic_vector( 4 downto 0 ) := "01011"; 
	constant XNORI : std_logic_vector( 4 downto 0 ) := "01100"; 
	constant BEQI : std_logic_vector( 4 downto 0 ) := "01101"; 
	constant BNEI : std_logic_vector( 4 downto 0 ) := "01110"; 
	constant BLTI : std_logic_vector( 4 downto 0 ) := "01111"; 
	constant BLETI : std_logic_vector( 4 downto 0 ) := "10000"; 
	constant BGTI : std_logic_vector( 4 downto 0 ) := "10001"; 
	constant BGETI : std_logic_vector( 4 downto 0 ) := "10010"; 
	-- Operaciones tipo J
	constant OPCODE_B : std_logic_vector( 4 downto 0 ) := "10011"; 
	constant OPCODE_CALL : std_logic_vector( 4 downto 0 ) := "10100"; 
	-- Otros
	constant OPCODE_RET : std_logic_vector( 4 downto 0 ) := "10101"; 
	constant OPCODE_NOP : std_logic_vector( 4 downto 0 ) := "10110"; 
	-- Localidades sin usar
	constant SU : std_logic_vector( 3 downto 0 ) := "0000";
	-- Registros 
	constant R0 : std_logic_vector( 3 downto 0 ) := "0000";
	constant R1 : std_logic_vector( 3 downto 0 ) := "0001";
	constant R2 : std_logic_vector( 3 downto 0 ) := "0010";
	constant R3 : std_logic_vector( 3 downto 0 ) := "0011";
	constant R4 : std_logic_vector( 3 downto 0 ) := "0100";
	constant R5 : std_logic_vector( 3 downto 0 ) := "0101";
	constant R6 : std_logic_vector( 3 downto 0 ) := "0110";
	constant R7 : std_logic_vector( 3 downto 0 ) := "0111";
	constant R8 : std_logic_vector( 3 downto 0 ) := "1000";
	constant R9 : std_logic_vector( 3 downto 0 ) := "1001";
	constant R10 : std_logic_vector( 3 downto 0 ) := "1010";
	constant R11 : std_logic_vector( 3 downto 0 ) := "1011";
	constant R12 : std_logic_vector( 3 downto 0 ) := "1110";
	constant R13 : std_logic_vector( 3 downto 0 ) := "1101";
	constant R14 : std_logic_vector( 3 downto 0 ) := "1110";
	constant R15 : std_logic_vector( 3 downto 0 ) := "1111";
	
	type banco is array( 0 to (2**m)-1 ) of std_logic_vector( n-1 downto 0 );
	constant aux : banco := (
		LI & R0 & x"0000",
		LI & R1 & x"0001",
		LI & R2 & x"0000",
		LI & R3 & x"000c",
		TYPE_R & R4 & R0 & R1 & SU & ADD1,
		SWI & R4 & x"0072",
		ADDI & R0 & R1 & x"000",
		ADDI & R1 & R4 & x"000",
		ADDI & R2 & R2 & x"001",
		BNEI & R2 & R3 & x"00b",
		OPCODE_NOP & SU & SU & SU & SU & SU,
		OPCODE_B & SU & x"000a",
		others => ( others => '0' )
	);
begin
    output <= aux( conv_integer( addr_bus ) );
end Behavioral;
