//39.92s
//2
PROGRAM WeatherStation
VAR
    aiTemperature: INT; // Analog input value for temperature
    aiHumidity: INT; // Analog input value for humidity
    rTemperatureC: REAL; // Scaled temperature in degrees Celsius
    rHumidityPct: REAL; // Scaled humidity in percent
    DisplayText: STRING; // Text to be displayed
END_VAR

// Assuming aiTemperature and aiHumidity are scaled appropriately to 0-100% for the 0-32767 range
rTemperatureC := (REAL(aiTemperature) / 32767) * 100; // Convert to degrees Celsius (example scaling)
rHumidityPct := (REAL(aiHumidity) / 32767) * 100; // Convert to percent (example scaling)

IF rTemperatureC < 18 THEN
    DisplayText := 'Cold';
ELSIF rTemperatureC > 25 THEN
    DisplayText := 'Hot';
ELSE
    // Temperature is between 18 and 25 degrees Celsius, check humidity
    IF rHumidityPct >= 40 AND rHumidityPct <= 75 THEN
        DisplayText := 'Opt'; // Optimum conditions
    ELSE
        DisplayText := 'Temp. OK'; // Temperature is okay, but humidity is not in the optimum range
    END_IF;
END_IF;

END_PROGRAM
