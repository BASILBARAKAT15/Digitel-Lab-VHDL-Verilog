

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;


entity Main is
    Port ( clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           RXD : in STD_LOGIC;
           TXD : out STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end Main;



architecture Behavioral of Main is
component  Minimal_UART_CORE is
port( 
	  CLOCK 		:  in    std_logic;
	  EOC		   :  out   std_logic;
	  OUTP      :  inout std_logic_vector(7 downto 0) := "ZZZZZZZZ";
	  RXD       :  in	std_logic;	
	  TXD			: 	out std_logic;
	  EOT			:	out std_logic;
	  INP 		: in std_logic_vector(7 downto 0);	
	  READY     :  out   std_logic;
	  WR			:  in    std_logic	  
    );
end component;
 signal EOC, EOT, READY, WR : std_logic;
 signal INP, OUTP : std_logic_vector(7 downto 0);
begin
U1: Minimal_UART_CORE port map(CLK,EOC,OUTP,RXD,TXD,EOT,INP,READY,WR);
process(clk,Reset)
begin
if (Reset ='0')then
 LED <= (others => '0');
end if;
if (clk'event and clk ='1')then  
  if (EOC='1')then
  WR<= '0';
  INP<= OUTP + 1 ;
  LED<= OUTP;
  if(READY = '1')then
  WR<='1';
  end if ;
 if(READY = '0')then
  WR<= '0';
  end if ;
  end if;
  end if ;
end process;
end Behavioral;
