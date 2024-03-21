// 34.91s
// 4
PROGRAM WeatherStation
VAR
    aiOutside : INT; // Analog input for temperature
    aiHumidity: INT; // Analog input for humidity
    sShowText : STRING[80]; // String to display the status
END_VAR

// Temperature and humidity evaluation
IF aiOutside < 18 THEN
    sShowText := 'Cold'; // Temperature below 18°C
ELSIF aiOutside > 25 THEN
    sShowText := 'Hot'; // Temperature above 25°C
ELSE
    // Temperature between 18°C and 25°C
    IF aiHumidity >= 40 AND aiHumidity <= 75 THEN
        sShowText := 'Opt'; // Optimum conditions
    ELSE
        sShowText := 'Temp. OK'; // Temperature okay, but humidity not in optimum range
    END_IF;
END_IF;
