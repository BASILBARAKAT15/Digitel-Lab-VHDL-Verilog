library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bit4Adder is
Port (
a : in STD_LOGIC_VECTOR (3 downto 0);
b : in STD_LOGIC_VECTOR (3 downto 0);
cin : in STD_LOGIC;
s : out STD_LOGIC_VECTOR (3 downto 0);
cout : out STD_LOGIC
);
end bit4Adder;

architecture Behavioral of bit4Adder is
begin
process (a, b, cin)
variable temp_sum : STD_LOGIC_VECTOR(4 downto 0);
begin
temp_sum := ('0' & a) + ('0' & b) ;
s <= temp_sum(3 downto 0);
cout <= temp_sum(4);
end process;
end Behavioral;