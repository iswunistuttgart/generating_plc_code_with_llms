//58.46s
//2
PROGRAM WeatherStation
VAR
    AnalogTempInput : INT; (* Input: Analog value representing the temperature *)
    AnalogHumidityInput : INT; (* Input: Analog value representing the humidity *)
    TemperatureC : REAL; (* The temperature in degrees Celsius *)
    Humidity : REAL; (* The humidity in percent *)
    DisplayText : STRING; (* Output: Text to display based on temperature and humidity *)
END_VAR

(* Constants for temperature conversion *)
CONST
    TEMP_SCALE : REAL := 0.1; (* Assuming the analog input represents temperature in tenths of degrees *)
    HUMIDITY_SCALE : REAL := 0.1; (* Assuming the analog input represents humidity in tenths of percent *)
END_CONST

(* Convert the analog inputs to meaningful values *)
TemperatureC := AnalogTempInput * TEMP_SCALE;
Humidity := AnalogHumidityInput * HUMIDITY_SCALE;

(* Evaluate temperature and humidity, then set display text *)
IF TemperatureC < 18 THEN
    DisplayText := 'Cold';
ELSIF TemperatureC <= 25 THEN
    (* Nested IF for humidity check within optimal temperature range *)
    IF Humidity >= 40 AND Humidity <= 75 THEN
        DisplayText := 'Opt';
    ELSE
        DisplayText := 'Temp. OK';
    END_IF;
ELSE
    DisplayText := 'Hot';
END_IF;

END_PROGRAM
