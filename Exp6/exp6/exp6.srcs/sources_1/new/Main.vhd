----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2025 12:26:04 PM
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

entity Main is
port(
clk:in std_logic ;
a,b:in std_logic_vector(3 downto 0);
p:out std_logic_vector (7 downto 0)
);
end Main;

architecture Behavioral of Main is
component mult_gen_0 
  PORT (
    CLK : IN STD_LOGIC;
    A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    P : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
  end component;
begin
m1 : mult_gen_0 port map (clk,a,b,p);
end Behavioral;
