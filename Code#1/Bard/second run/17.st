//10.15s
// 2
PROGRAM WeatherStation
VAR
  temperatureAnalog: INT;
  temperatureCelsius: REAL;
  humidityAnalog: INT;
  humidityPercent: REAL;
  weatherText: STRING(20);

(* Read temperature analog value *)
temperatureAnalog := ReadAnalogInput(1);

(* Convert temperature analog value to Celsius *)
temperatureCelsius := temperatureAnalog * 100.0 / 32767.0;

(* Read humidity analog value *)
humidityAnalog := ReadAnalogInput(2);

(* Convert humidity analog value to percent *)
humidityPercent := humidityAnalog * 100.0 / 32767.0;

(* Determine weather text based on temperature *)
IF temperatureCelsius < 18.0 THEN
  weatherText := "Cold";
ELSIF 18.0 <= temperatureCelsius <= 25.0 THEN
  (* Check humidity to determine weather text *)
  IF 40.0 <= humidityPercent <= 75.0 THEN
    weatherText := "Opt";
  ELSE
    weatherText := "Temp. OK";
  END_IF;
ELSE
  weatherText := "Hot";
END_IF;

(* Display weather text *)
WriteOutput("Temperature: " + STR(temperatureCelsius) + " °C");
WriteOutput("Humidity: " + STR(humidityPercent) + " %");
WriteOutput("Weather: " + weatherText);

END_PROGRAM
