// 85.19638061523438s
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
    signal s_temp : integer range -40 to 125;
    signal s_humidity : integer range 0 to 100;
begin
    p_mux : process(clk)
    begin
        if rising_edge(clk) then
            s_temp <= conv_integer(unsigned(an_temp));
            s_humidity <= conv_integer(unsigned(an_humidity));
            
            if (s_temp < 18) then
                seg_o <= "0000001"; -- Cold
            elsif (s_temp >= 18 and s_temp <= 25) then
                if (s_humidity >= 40 and s_humidity <= 75) then
                    seg_o <= "0011111"; -- Opt
                else
                    seg_o <= "0000110"; -- Temp. OK
                end if;
            elsif (s_temp > 25) then
                seg_o <= "0000000"; -- Hot
            end if;
        end if;
    end process p_mux;
end Behavioral;
```
###Simulation:
![simulation](images/simulation.png)
