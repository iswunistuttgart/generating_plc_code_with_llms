VAR
    aiOutside : INT;
    aiHumidity: INT;
    sShowText : STRING[80];
END_VAR

IF aiOutside < 18 THEN
    sShowText := 'Cold';
ELSIF (aiOutside >= 18) AND (aiOutside <= 25) THEN
    IF (aiHumid >= 40) AND (aiHumid <= 75) THEN
        sShowText := 'Opt';
    ELSE
        sShowText := 'Temp. Ok';
    END_IF
ELSE
    sShowText := 'Hot';
END_IF;

