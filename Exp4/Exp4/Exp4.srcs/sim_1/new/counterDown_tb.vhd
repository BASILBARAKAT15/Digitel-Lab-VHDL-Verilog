library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counterDown_tb is
end counterDown_tb;

architecture Behavioral of counterDown_tb is
    component countDown
        port(
            clk : in std_logic;
            set : in std_logic;
            InitValuel : in std_logic_vector(3 downto 0);
            InitValue0 : in std_logic_vector(3 downto 0);
            Digitl : out std_logic_vector(3 downto 0);
            Digit0 : out std_logic_vector(3 downto 0);
            Timer_Done : out std_logic
        );
    end component;

    signal clk, set : std_logic := '0';
    signal InitValuel, InitValue0 : std_logic_vector(3 downto 0) := "0000";
    signal Digit1, Digit0 : std_logic_vector(3 downto 0);
    signal Timer_Done : std_logic;
    constant clk_period : time := 20 ns;
begin
    uut: countDown port map (
        clk => clk,
        set => set,
        InitValuel => InitValuel,
        InitValue0 => InitValue0,
        Digitl => Digit1,
        Digit0 => Digit0,
        Timer_Done => Timer_Done
    );

   
    process
    begin
       
        InitValuel <= "0010"; 
        InitValue0 <= "0000"; 
        wait for clk_period * 4;

        set <= '1';
        wait for clk_period;
        set <= '0';

        wait for clk_period * 25;

        wait;
    end process;

    process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;
end Behavioral;
