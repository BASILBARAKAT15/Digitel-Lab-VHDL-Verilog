----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2025 12:23:53 PM
-- Design Name: 
-- Module Name: TimeMux - Behavioral
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


entity TimeMux is
    Port ( clk : in STD_LOGIC;
           Digit0 : in STD_LOGIC_VECTOR (3 downto 0);
           Digitl : in STD_LOGIC_VECTOR (3 downto 0);
           BCD_Value : out STD_LOGIC_VECTOR (3 downto 0);
           DigSelect : out STD_LOGIC);
end TimeMux;

farchitecture Behavioral of TimeMux is
Signal DigitSelected:std_logic;
Signal Counter :integer:=1;

begin
DigSelect<=DigitSelected;
process(clk)
begin
if(clk' event and clk='1')then
if(Counter=1_000_000)then
Counter<=0;
DigitSelected<=not DigitSelected;
if(DigitSelected='0')then
BCD_Value<=Digitl;
else 
BCD_Value<=Digit0;
end if;
else 
Counter<=Counter+1;
end if ;
end if;
end process;
end Behavioral;
