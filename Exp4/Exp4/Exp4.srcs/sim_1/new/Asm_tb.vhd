----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2025 11:57:13 AM
-- Design Name: 
-- Module Name: Asm_tb - Behavioral
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



entity Asm_tb is
--  Port ( );
end Asm_tb;

architecture Behavioral of Asm_tb is

component Asm
        port(clk, reset, s : in STD_LOGIC;
        Timer_Done :in STD_LOGIC;
        set, R, Y, G : out STD_LOGIC;
        TimerDigit0 : out STD_LOGIC_VECTOR (3 downto 0);
        TimerDigit1 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

Signal clk , reset , s , Timer_Done , set, R, Y, G  : STD_LOGIC := '0';
Signal TimerDigit0 , TimerDigit1 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
constant clk_period : time := 20 ns;
begin

UUT : Asm Port map(
    clk => clk,
    reset => reset,
    s => s,
    Timer_Done => Timer_Done,
    set => set,
    R => R,
    Y => Y,
    G => G,
    TimerDigit0 => TimerDigit0,
    TimerDigit1 => TimerDigit1
);

simulate : process begin
    reset <= '1'; 
    wait for clk_period*2;
    
    reset <= '0'; 
    wait for clk_period;
      
    s <= '1';
    wait for clk_period*20;
    Timer_Done <= '1';
    wait for clk_period;    
    Timer_Done <= '0';
    wait for clk_period*3;
    Timer_Done <= '1';
    wait for clk_period;
    Timer_Done <= '0'; 
    wait for clk_period*20;
    Timer_Done <= '1';
    wait for clk_period;
    Timer_Done <= '0';
    wait for clk_period*3;
    Timer_Done <= '1';
    wait for clk_period;
    wait;
    
end process;

clk_generator : process begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
end process;


end Behavioral;
