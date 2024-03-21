// 7.17s
// 2
VAR
  aiOutside : INT;
  aiHumidity: INT;
  sShowText : STRING[80];
END_VAR

START

    aiOutside := ReadAnalogInput();
    aiHumidity := ReadAnalogInput();

    IF (aiOutside < 18) THEN
        sShowText := "Cold";
    ELSIF (aiOutside <= 25) AND (aiHumidity >= 40) AND (aiHumidity <= 75) THEN
        sShowText := "Opt";
    ELSIF (aiOutside <= 25) AND (aiHumidity < 40) OR (aiHumidity > 75) THEN
        sShowText := "Temp. OK";
    ELSE
        sShowText := "Hot";
    END_IF;

    DisplayText(sShowText);
END_START