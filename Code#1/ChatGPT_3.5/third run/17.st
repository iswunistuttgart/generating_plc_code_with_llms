//10.61s
//2 Var an falscher Stelle, sonst 4
PROGRAM WeatherStation
VAR_INPUT
    Temperature: INT;  // Input temperature in degrees Celsius (0 - 100)
    Humidity: INT;     // Input humidity in percentage (0 - 100)
END_VAR

VAR_OUTPUT
    DisplayText: STRING := '';  // Output text for display
END_VAR

METHOD DisplayWeatherStatus
    IF Temperature < 18 THEN
        DisplayText := 'Cold';
    ELSIF Temperature >= 18 AND Temperature <= 25 AND Humidity >= 40 AND Humidity <= 75 THEN
        DisplayText := 'Opt';
    ELSIF Temperature > 25 THEN
        DisplayText := 'Hot';
    ELSE
        DisplayText := 'Temp. OK';
    END_IF
END_METHOD

END_PROGRAM
