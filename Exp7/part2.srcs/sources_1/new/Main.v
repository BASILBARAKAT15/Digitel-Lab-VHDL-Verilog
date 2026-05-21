----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2025 01:45:49 PM
-- Design Name: 
-- Module Name: Main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main is
    Port ( clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           TXD : out STD_LOGIC;
           RXD : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end Main;

architecture Behavioral of Main is

component Minimal_UART_CORE is 
port(
CLOCK : in std_logic;
EOC: out std_logic ;
OUTP : inout std_logic_vector(7 downto 0):="ZZZZZZZZ";
RXD: in std_logic ;
TXD: out std_logic;
EOT: out std_logic;
INP: in std_logic_vector(7 downto 0);
READY: out std_logic;
WR: in std_logic);
end component;

signal EOC: std_logic;
signal EOT: std_logic;
signal READY : std_logic;
signal INP : std_logic_vector(7 downto 0);
signal OUTP : std_logic_vector(7 downto 0);
signal WR: std_logic:='0';
signal Message : STD_LOGIC_VECTOR(31 downto 0) := X"54534D53"; 
signal Char_Index : INTEGER range 0 to 4 := 0;
signal Sending : STD_LOGIC_VECTOR(1  downto 0) := "00";
signal counter: INTEGER range 0 to 1000000 := 0;
begin
u1 :Minimal_UART_CORE port map(CLK,EOC,OUTP,RXD,TXD,EOT,INP,READY,WR);
process(CLK, Reset)
begin
if Reset = '0' then
WR <= '0';
INP <= (others => '0');
LED <= (others => '0');
Char_Index <= 0;
Sending <= "00";
counter <= 0;
elsif (CLK'event and CLK = '1') then
case Sending is
when "00" =>
if EOC = '1' then
LED <= OUTP;
Sending <= "01";
Char_Index <= 0;
end if;
when "01" =>
case Char_Index is
when 0 => INP <= Message(31 downto 24);
when 1 => INP <= Message(23 downto 16);
when 2 => INP <= Message(15 downto 8);
when 3 => INP <= Message(7 downto 0);
when others => sending <= "00";
end case;
if(Char_index < 4 ) then
WR <= '1';  
Sending <= "10";   
end if;
counter <= 0;
when "10" =>
WR <= '0';
if (READY = '1') then
if (counter < 1000000) then
counter <= counter + 1;
else
if (Char_Index = 4) then
Sending <= "00";
Char_Index <= 0;
else
Char_Index <= Char_Index + 1;
Sending <= "01";
end if;
end if;
end if;
when others =>
Sending <= "00";
end case;
end if;
end process;
end Behavioral;
