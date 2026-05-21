----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2025 12:41:09 PM
-- Design Name: 
-- Module Name: TopLevel - Behavioral
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




entity TopLevel is
    Port ( clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           s : in STD_LOGIC;
           R : out STD_LOGIC;
           Y : out STD_LOGIC;
           G : out STD_LOGIC;
           sevenSeg : out STD_LOGIC_VECTOR (6 downto 0);
           C : out STD_LOGIC);
end TopLevel;

architecture Behavioral of TopLevel is
component Asm
port ( clk, Reset, s : in STD_LOGIC;
 Timer_Done : in STD_LOGIC;
 set, R, Y, G : out STD_LOGIC;
 TimerDigit0 : out STD_LOGIC_VECTOR (3 downto 0);
 TimerDigit1 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component PBDebouncer
Port ( CLK : in STD_LOGIC;
        PB : in STD_LOGIC;
        PB_debounced: out STD_LOGIC);

end component;

component clkDivider
Port( CLK_IN : in STD_LOGIC;
 CLK_OUT : out STD_LOGIC);

end component;

component countDown
Port (
 clk : in std_logic;    set : in std_logic; 
  InitValuel : in std_logic_vector(3 downto 0);
 InitValue0 : in std_logic_vector(3 downto 0);
  Digitl : out std_logic_vector(3 downto 0); 
 Digit0 : out std_logic_vector(3 downto 0); 


 Timer_Done : out std_logic
 );
end component;

component TimeMUX
Port (  clk : in STD_LOGIC;
         Digit0 : in STD_LOGIC_VECTOR (3 downto 0);
         Digitl : in STD_LOGIC_VECTOR (3 downto 0);
         BCD_Value : out STD_LOGIC_VECTOR (3 downto 0);
         DigSelect : out STD_LOGIC);
end component;

component BcdToSeg
Port ( BCD: in STD_LOGIC_VECTOR(3 downto 0);
 AA : out STD_LOGIC;
 AB : out STD_LOGIC; 
 AC : out STD_LOGIC; 
 AD : out STD_LOGIC;
 AE : out STD_LOGIC;    
 AF : out STD_LOGIC;
 AG : out STD_LOGIC);

end component;
signal sdepout,resetdepout,TDONE,SET,clk_1hz:std_logic;
signal TD0,TD1,D0,D1,BCD_Value:STD_LOGIC_VECTOR (3 downto 0);
begin 

l1:PBDebouncer port map(clk,s,sdepout);
l2:PBDebouncer port map(clk,Reset,resetdepout);
l3:Asm port map(clk,resetdepout,sdepout,TDONE,SET,R,Y,G,TD0,TD1);
l4:clkDivider port map(clk,clk_1hz);
l5:countDown port map(clk_1hz,set,TD1,TD0,D1,D0,TDONE);
l6:TimeMUX port map(clk,D0,D1,BCD_Value,C);
l7:BcdToSeg port map(BCD_Value,sevenSeg(0),sevenSeg(1),sevenSeg(2),sevenSeg(3),sevenSeg(4),sevenSeg(5),sevenSeg(6));

end Behavioral;
