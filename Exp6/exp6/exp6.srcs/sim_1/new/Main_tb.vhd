


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;




entity Main_tb is
end Main_tb;

architecture Behavioral of Main_tb is
component Main 
  PORT (
    CLK : IN STD_LOGIC;
    A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    P : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
end component;
signal clk:std_logic:='0'; 
signal a,b : std_logic_vector(3 downto 0);
signal p : std_logic_vector (7 downto 0) ; 
begin
m1: Main port map (clk,a,b,p); 
process 
begin 
clk<='0'; 
wait for 10ns;
clk<='1'; 
wait for 10ns ;
end process ;
process 
begin 
for i in 0 to 15 loop 
for j in 0 to 15 loop
a <= std_logic_vector(to_unsigned(i,4));
b<=std_logic_vector(TO_UNSIGNED(j,4));
wait for 20ns;
end loop; 
end loop; 
end process ;


end Behavioral;
