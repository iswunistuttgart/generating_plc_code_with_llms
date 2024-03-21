//9.48s
// 2
(* Program to display weather information based on temperature and humidity *)

VAR
  temperature: REAL; (* Analog input value for temperature *)
  humidity: REAL; (* Analog input value for humidity *)
  weatherMessage: STRING(8); (* Text message to display *)

(* Main program *)
PROGRAM Main
BEGIN
  (* Read analog input values *)
  temperature := ReadAnalogInput(temperatureSensor);
  humidity := ReadAnalogInput(humiditySensor);

  (* Evaluate temperature *)
  IF temperature < 18 THEN
    weatherMessage := "Cold";
  ELSIF temperature < 25 THEN
    (* Evaluate humidity within the temperature range *)
    IF 