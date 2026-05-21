
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity countDown is
    Port (
        clk         : in std_logic;
        set         : in std_logic; 
        InitValuel  : in std_logic_vector (3 downto 0); 
        InitValue0  : in std_logic_vector (3 downto 0); 
        Digitl      : out std_logic_vector (3 downto 0); 
        Digit0      : out std_logic_vector (3 downto 0); 
        Timer_Done  : out std_logic
    );
end countDown;

architecture Behavioral of countDown is
begin
    process (clk, set)
        variable D1 : std_logic_vector (3 downto 0) := "0000";
        variable D0 : std_logic_vector (3 downto 0) := "0000";
    begin
        if (set = '1') then
            D1 := InitValuel;
            D0 := InitValue0;
            Timer_Done <= '0';

        elsif (clk'event and clk = '1') then
            if (D0 = "0000") then
                if (D1 = "0000") then
                    Timer_Done <= '1';
                else
                    D1 := D1 - 1;
                    D0 := "1001"; 
                end if;
            else 
      
                D0 := D0 - 1;
            end if;
        end if;

        
        Digitl <= D1;
        Digit0 <= D0;
    end process;
end Behavioral;
