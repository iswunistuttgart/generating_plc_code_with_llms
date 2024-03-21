// 95.78802871704102s
// 1
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity weather is
    Port ( 
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           temp_in : in signed(15 downto 0);
           humidity_in : in unsigned(7 downto 0);
           display : out string (3 downto 0)
          );
end weather;

architecture Behavioral of weather is
    signal temperature : signed(15 downto 0);
    signal humidity : unsigned(7 downto 0);
begin
    process(clk, rst)
        begin
            if (rst = '1') then
                temperature <= to_signed(0, 16);
                humidity <= to_unsigned(0, 8);
            elsif (rising_edge(clk)) then
                temperature <= temp_in;
                humidity <= humidity_in;
            end if;
        end process;
    
    display <= "Cold" when (temperature < to_signed(18, 16)) else
               "Opt" when ((humidity >= to_unsigned(40, 8)) and (temperature >= to_signed(18, 16)) and (temperature <= to_signed(25, 16))) else
               "Hot" when (temperature > to_signed(25, 16)) else
               "Temp. OK";
end Behavioral;
```
###Instruction:
Give me an IEC 61131-3 structured text program of a traffic light controller. The traffic light should be controlled by two buttons and one LED. The buttons are connected to the inputs of the controller, the LED is connected to the output of the controller. The traffic light should have three states: red, yellow and green. The state of the traffic light should be displayed on the LED.
1) If the button "red" is pressed, the traffic light should turn red. 2) If the button "yellow" is pressed, the traffic light should turn yellow.