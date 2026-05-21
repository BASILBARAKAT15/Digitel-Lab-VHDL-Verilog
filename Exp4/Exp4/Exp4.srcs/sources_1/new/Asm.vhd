----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2025 11:54:51 AM
-- Design Name: 
-- Module Name: Asm - Behavioral
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



entity Asm is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           s : in STD_LOGIC;
           Timer_Done : in STD_LOGIC;
           set : out STD_LOGIC;
           r : out STD_LOGIC;
           y : out STD_LOGIC;
           g : out STD_LOGIC;
           TimerDigit1 : out STD_LOGIC_VECTOR (3 downto 0);
           TimerDigit0 : out STD_LOGIC_VECTOR (3 downto 0));
end Asm;

architecture Behavioral of Asm is

type state_type is (T0,T1,T2,T3,T4,T5,T6,T7,T8);
signal current_state, next_state :state_type ;

begin

state_register : process( clk, reset)
begin
    if(reset = '1') then
        current_state <= T0;
    elsif (clk'event and clk = '1') then
        current_State <= next_state;
    end if;
end process;

next_state_process :process( s, current_State, Timer_Done)
begin
    case current_state is
    when T0 =>
        if s='1'then 
           next_state<=T1;
        else
           next_state<=T0;
        end if;
    when T1 => next_state<=T2;
    when T2 =>
        if Timer_Done='1'then 
           next_state<=T3;
        else
           next_state<=T2;
        end if;
    when T3 => next_state<=T4;
    when T4 =>
        if Timer_Done='1'then 
           next_state<=T5;
        else
           next_state<=T4;
        end if; 
    when T5 => next_state<=T6; 
    when T6 =>
        if Timer_Done='1'then 
           next_state<=T7;
        else
           next_state<=T6;
        end if;  
    when T7 => next_state<=T8;   
    when T8 =>
        if Timer_Done='1'then 
           next_state<=T1;
        else
           next_state<=T8;
        end if;
        when others =>next_state <= T0;        
    end case;                
end process;


output_process:process( clk)
begin
if(clk'event and clk = '1') then
 case current_state is
 when T0 =>
        TimerDigit0<="0000";
        TimerDigit1<="0000";
        set<='1';
        R<='0';
        y<='0';
        G<='0';
 when T1 =>
       TimerDigit0<="0000";
        TimerDigit1<="0010";
        set<='1';
        R<='1';
        y<='0';
        G<='0';
  when T2=>
                set<='0';
  when T3 =>
       TimerDigit0<="0011";
        TimerDigit1<="0000";
        set<='1';
        R<='1';
        y<='1';
        G<='0';              
   when T4=>
                set<='0'; 
    when T5 =>
       TimerDigit0<="0000";
        TimerDigit1<="0010";
        set<='1';
        R<='0';
        y<='0';
        G<='1';     
        
    when T6=>
                set<='0'; 
    when T7 =>
       TimerDigit0<="0011";
        TimerDigit1<="0000";
        set<='1';
        R<='0';
        y<='1';
        G<='0';
        
         when T8=>
                set<='0';                     
end case;
  end if;    
                       
end process;
end Behavioral;

