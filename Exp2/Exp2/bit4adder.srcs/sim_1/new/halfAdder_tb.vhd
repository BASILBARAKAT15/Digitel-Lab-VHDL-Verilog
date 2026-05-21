

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfAdder_tb is
end halfAdder_tb;

architecture Behavioral of halfAdder_tb is

  component halfAdder
    Port(
      a    : in  STD_LOGIC;
      b    : in  STD_LOGIC;
      s    : out STD_LOGIC;
      Cout : out STD_LOGIC
    );
  end component;

  signal a, b, s, Cout : STD_LOGIC := '0';

begin

  uut: halfAdder port map (
    a    => a,
    b    => b,
    s    => s,
    Cout => Cout
  );

  stimulus: process
  begin
    a <= '0'; b <= '0'; wait for 10 ns;
    a <= '1'; b <= '0'; wait for 10 ns;
    a <= '0'; b <= '1'; wait for 10 ns;
    a <= '1'; b <= '1'; wait for 10 ns;
    wait;
  end process;

end Behavioral;
