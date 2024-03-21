//41.87s
//2
PROGRAM WeatherStation
VAR
    nAnalogTempValue : INT; // Analog value from the temperature sensor
    nAnalogHumidValue : INT; // Analog value from the humidity sensor
    fTemperature : REAL; // Temperature in degrees Celsius
    fHumidity : REAL; // Humidity in percent
    sDisplayText : STRING; // Text to display in the house
END_VAR

// Constants for conversion (Assuming linear conversion, adjust as per your sensor specifications)
CONST
    TEMP_MIN : REAL := 0.0; // Minimum temperature sensor reading corresponds to
    TEMP_MAX : REAL := 50.0; // Maximum temperature sensor reading corresponds to
    HUMID_MIN : REAL := 0.0; // Minimum humidity sensor reading corresponds to
    HUMID_MAX : REAL := 100.0; // Maximum humidity sensor reading corresponds to
    ANALOG_MIN : INT := 0; // Minimum analog value
    ANALOG_MAX : INT := 32767; // Maximum analog value
END_CONST

// Convert the analog values to meaningful units
fTemperature := (fTemperature - TEMP_MIN) / (ANALOG_MAX - ANALOG_MIN) * (TEMP_MAX - TEMP_MIN);
fHumidity := (fHumidity - HUMID_MIN) / (ANALOG_MAX - ANALOG_MIN) * (HUMID_MAX - HUMID_MIN);

// Determine the temperature status
IF fTemperature < 18 THEN
    sDisplayText := 'Cold';
ELSIF fTemperature > 25 THEN
    sDisplayText := 'Hot';
ELSE
    // Nested IF for humidity check when temperature is between 18°C and 25°C
    IF fHumidity >= 40 AND fHumidity <= 75 THEN
        sDisplayText := 'Opt';
    ELSE
        sDisplayText := 'Temp. OK';
    END_IF
END_IF

END_PROGRAM
