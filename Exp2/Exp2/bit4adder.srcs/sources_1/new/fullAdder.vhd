library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
    Port ( a    : in  STD_LOGIC;
           b    : in  STD_LOGIC;
           Cin  : in  STD_LOGIC;
           s    : out STD_LOGIC;
           Cout : out STD_LOGIC);
end fullAdder;

architecture Behavioral of fullAdder is
    component halfAdder
        Port ( a    : in  STD_LOGIC;
               b    : in  STD_LOGIC;
               s    : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;

    signal s1, cout1, cout2 : STD_LOGIC;
begin
    u1: halfAdder port map(a => a, b => b, s => s1, Cout => cout1);
    u2: halfAdder port map(a => s1, b => Cin, s => s, Cout => cout2);
    Cout <= cout1 or cout2;
end Behavioral;
