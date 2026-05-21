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
component fulladder
   Port ( a   : in  STD_LOGIC;
           b   : in  STD_LOGIC;
           cin  : in  STD_LOGIC;
           s  : out STD_LOGIC;
           cout : out STD_LOGIC);
           end component ;
  signal c1 , c2 ,c3 ,c4:std_logic;         
          
begin
u1:fulladder port map (a(0),b(0),'0',s(0),c1);
u2:fulladder port map (a(1),b(1),c1,s(1),c2);
u3:fulladder port map (a(2),b(2),c2,s(2),c3);
u4:fulladder port map (a(3),b(3),c3,s(3),c4);
cout<=c4;
end Behavioral;