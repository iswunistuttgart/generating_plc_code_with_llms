//11.4s
// 2
PROGRAM WeatherStation

VAR
  temperatureAnalogValue: INT; // Temperature analog input value
  temperaturePercent: REAL; // Temperature converted to percent
  humidity: INT; // Humidity analog input value
  humidityPercent: REAL; // Humidity converted to percent
  temperatureText: STRING(10); // Text representation of temperature
  overallText: STRING(10); // Overall assessment of temperature and humidity

BEGIN

  // Read temperature analog value
  temperatureAnalogValue := ReadAnalogInput(TemperatureAnalogInputChannel);

  // Convert temperature analog value to percent
  temperaturePercent := REAL(temperatureAnalogValue) / 32767.0 * 100.0;

  // Evaluate temperature and set temperature text
  IF temperaturePercent < 18.0 THEN
    temperatureText := 'Cold';
  ELSIF temperaturePercent <= 25.0 THEN
    temperatureText := 'Opt';
  ELSE
    temperatureText := 'Hot';
  END_IF;

  // Read humidity analog value
  humidity := ReadAnalogInput(HumidityAnalogInputChannel);

  // Convert humidity analog value to percent
  humidityPercent := REAL(humidity) / 32767.0 * 100.0;

  // Evaluate humidity and temperature
  IF 40.0 <= humidityPercent <= 75.0 AND 18.0 <= temperaturePercent <= 25.0 THEN
    overallText := 'Opt';
  ELSE
    overallText := 'Temp. OK';
  END_IF;

  // Display temperature and humidity
  WRITE_STRING('Temperature: ' + STRING(temperaturePercent) + '% - ' + temperatureText);
  WRITE_STRING('Humidity: ' + STRING(humidityPercent) + '% - ' + overallText);

END_PROGRAM