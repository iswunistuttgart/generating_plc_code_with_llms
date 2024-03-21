// 95.76264309883118s
// 1
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity weather is
    Port ( clk : in STD_LOGIC;
           an_temp : in  STD_LOGIC_VECTOR (10 downto 0);
           an_humidity : in  STD_LOGIC_VECTOR (7 downto 0);
           seg_o : out  STD_LOGIC_VECTOR (6 downto 0));
end weather;

architecture Behavioral of weather is
    signal s_temp : integer range -40 to 125 := 25; -- default value 25°C
    signal s_humidity : integer range 0 to 100 := 50; -- default value 50%
begin

p_mux : process(clk)
begin
    if rising_edge(clk) then
        if (s_temp < 18) then
            seg_o <= "0000001";
        elsif (s_temp >= 18 and s_temp < 25) then
            seg_o <= "0010011";
        else
            seg_o <= "0010010";
        end if;
    end if;
end process p_mux;

p_control : process(clk)
begin
    if rising_edge(clk) then
        if (s_humidity >= 40 and s_humidity <= 75) then
            if (s_temp >= 18 and s_temp < 25) then
                seg_o <= "0010011";
            else
                seg_o <= "0010010";
            end if;
        else
            seg_o <= "0000100";
        end if;
    end if;
end process p_control;

p_temp : process(clk)
begin
    if rising_edge(clk) then
        s_temp <= conv_integer(unsigned(an_