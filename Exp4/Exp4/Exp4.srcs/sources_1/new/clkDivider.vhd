----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2025 11:53:46 AM
-- Design Name: 
-- Module Name: clkDivider - Behavioral
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

entity clkDivider is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clkDivider;

architecture Behavioral of clkDivider is

 signal counter:integer:=0;
    begin
    process(clk_in)
    variable  clockOut:std_logic:='0';
begin
    if(clk_in' event and clk_in='1') then
         if(counter=49999999) then
            counter<=0;
            clockOut:=not clockOut;
         else
            counter<=counter+1;
         end if;
    end if;
    clk_out<=clockOut;
    end process;


end Behavioral;
