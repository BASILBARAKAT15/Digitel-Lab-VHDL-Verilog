----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2025 12:04:39 PM
-- Design Name: 
-- Module Name: bit4Adder_tb - Behavioral
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
use IEEE.std_logic_1164.unsigned;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bit4Adder_tb is
--  Port ( );
end bit4Adder_tb;

architecture Behavioral of bit4Adder_tb is
 
component bit4Adder
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
cin : in STD_LOGIC;
s : out STD_LOGIC_VECTOR (3 downto 0);
cout : out STD_LOGIC);
end component;
signal A : STD_LOGIC_VECTOR (3 downto 0);
signal B : STD_LOGIC_VECTOR (3 downto 0);
signal s : STD_LOGIC_VECTOR (3 downto 0);
signal cout : STD_LOGIC;


begin

uut: bit4Adder port map(A=>A,B=>B,cin =>'0',s=>s,cout=>cout);

process

begin
for i in 0 to 15 loop
for j in 0 to 15 loop
A <= std_logic_vector(TO_UNSIGNED(i,4));
B <= std_logic_vector(TO_UNSIGNED(j,4));
wait for 10ns;
end loop;
end loop;
wait;
end process;

end Behavioral;
