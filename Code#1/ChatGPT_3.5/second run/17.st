//16.93s
//2
PROGRAM WeatherStation
VAR
    TemperatureSensorValue: INT := 0;  // Analog input value for temperature (0 - 32767)
    HumiditySensorValue: INT := 0;  // Analog input value for humidity (0 - 32767)
    TemperatureText: STRING := "";  // Text to display temperature condition
END_VAR

BEGIN
    // Simulate reading temperature and humidity values from analog inputs
    // Replace with actual analog input readings in your system
    TemperatureSensorValue := 22000;  // Example temperature reading
    HumiditySensorValue := 5000;     // Example humidity reading

    // Evaluate temperature condition
    IF TemperatureSensorValue < 18000 THEN
        TemperatureText := "Cold";
    ELSIF TemperatureSensorValue >= 18000 AND TemperatureSensorValue <= 25000 THEN
        // Temperature is in the optimum range (18 - 25°C), evaluate humidity
        IF HumiditySensorValue >= 4000 AND HumiditySensorValue <= 7500 THEN
            TemperatureText := "Opt";
        ELSE
            TemperatureText := "Temp. OK";
        END_IF
    ELSE
        TemperatureText := "Hot";
    END_IF

    // Display the temperature condition text inside the house
    // The value of TemperatureText can be displayed as needed
END_PROGRAM
