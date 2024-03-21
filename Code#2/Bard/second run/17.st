// 6.75s
// 2
VAR
  aiOutside : INT;
  aiHumidity: INT;
  sShowText : STRING[80];
END_VAR

aiOutside := Read_Analog_Input;
aiHumidity := Read_Humidity_Input;

IF aiOutside < 18 THEN
  sShowText := "Cold";
ELSIF aiOutside >= 18 AND aiOutside <= 25 THEN
  IF aiHumidity >= 40 AND aiHumidity <= 75 THEN
    sShowText := "Opt";
  ELSE
    sShowText := "Temp. OK";
  END_IF;
ELSIF aiOutside > 25 THEN
  sShowText := "Hot";
END_IF;

Write_Display(sShowText);