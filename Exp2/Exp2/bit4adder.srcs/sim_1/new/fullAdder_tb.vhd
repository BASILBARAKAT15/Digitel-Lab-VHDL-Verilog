library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder_tb is
end;


architecture FA of FullAdder_tb is
component FullAdder
Port ( a : in STD_LOGIC;
b : in STD_LOGIC;
cin : in STD_LOGIC;
s : out STD_LOGIC;
cout : out STD_LOGIC);
end component;
signal a :STD_LOGIC:='0';
signal b :STD_LOGIC:='0';
signal cin :STD_LOGIC:='0';
signal s :STD_LOGIC:='0';
signal cout :STD_LOGIC:='0';


begin

uut: FullAdder port map (a,b,cin,s,cout);
process
begin
a<='0';
b<='0';
cin<='0';
wait for 10ns;
a<='1';
b<='0';
cin<='0';
wait for 10ns;
a<='0';
b<='1';
cin<='0';
wait for 10ns;
a<='1';
b<='1';
cin<='0';
wait for 10ns;

a<='0';
b<='0';
cin<='1';
wait for 10ns;
a<='1';
b<='0';
cin<='1';
wait for 10ns;
a<='0';
b<='1';
cin<='1';
wait for 10ns;
a<='1';
b<='1';
cin<='1';
wait for 10ns;

wait;
end process;

end;