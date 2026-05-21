----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2025 12:20:38 PM
-- Design Name: 
-- Module Name: PBDebouncer - Behavioral
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



entity PBDebouncer is
    Port ( CLK : in STD_LOGIC;
           PB : in STD_LOGIC;
           PB_debounced : out STD_LOGIC);
end PBDebouncer;

architecture Behavioral of PBDebouncer is

    Signal counter : integer := 1;
    Signal debounced_CLK : std_logic;
    Signal PB_old : std_logic := '0';
    Signal Ton : std_logic;
begin
PB_debounced <= debounced_CLK;
bouncing : process (clk) begin
    if(CLK'event and CLK = '1') then
        if(Ton = '0') then
            if (PB /= PB_old) then
                Ton <= '1';
            end if;   
        else 
            if(counter = 1000000) then
                debounced_CLK <= not debounced_CLK;
                counter <= 0;
                PB_old <= PB;
                Ton <= '0';
            else    
                counter <= counter + 1;
            end if; 
                 
        end if;
    end if;
end process;

end Behavioral;

