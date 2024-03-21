//10.91s
//4
PROGRAM WeatherStation
VAR
    TemperatureSensorValue: INT;   // Analog input value for temperature
    HumiditySensorValue: INT;      // Analog input value for humidity
    TemperatureText: STRING := ''; // Text representation of temperature status
    HumidityText: STRING := '';    // Text representation of humidity status
END_VAR

TemperatureSensorValue := YourTemperatureSensorFunction(); // Replace with your sensor reading
HumiditySensorValue := YourHumiditySensorFunction();       // Replace with your sensor reading

IF TemperatureSensorValue < 18 THEN
    TemperatureText := 'Cold';
ELSIF TemperatureSensorValue >= 18 AND TemperatureSensorValue <= 25 THEN
    IF HumiditySensorValue >= 40 AND HumiditySensorValue <= 75 THEN
        TemperatureText := 'Opt';
    ELSE
        TemperatureText := 'Temp. OK';
    END_IF;
ELSE
    TemperatureText := 'Hot';
END_IF

// Display the temperature status in the house
DISPLAY_IN_HOUSE(TemperatureText);

// Your program logic continues here

END_PROGRAM
