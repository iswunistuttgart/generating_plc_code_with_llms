// 7.17s
// 2
VAR
  aiOutside : INT;
  aiHumidity: INT;
  sShowText : STRING[80];
END_VAR

PROGRAM weather_station

aiOutside := 23;
aiHumidity := 60;

IF (aiOutside < 18) THEN
  sShowText := "Cold";
ELSIF (aiOutside < 25) THEN
  IF (aiHumidity >= 40 AND aiHumidity <= 75) THEN
    sShowText := "Opt";
  ELSE
    sShowText := "Temp. OK";
  ENDIF;
ELSE
  sShowText := "Hot";
ENDIF;

WRITE(sShowText);

END_PROGRAM