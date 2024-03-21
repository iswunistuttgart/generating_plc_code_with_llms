// 47.26889777183533s
// 4
```
FUNCTION TEXT_OUTPUT
VAR
    iTemp : INT;
    iHumidity : INT;
    sShowText : STRING[80];
END_VAR

IF (aiOutside < 18) THEN
    sShowText := 'Cold';
ELSIF (aiOutside >= 18 AND aiOutside <= 25) THEN
    IF (aiHumidity >= 40 AND aiHumidity <= 75) THEN
        sShowText := 'Opt';
    ELSE
        sShowText := 'Temp. OK';
    END_IF;
ELSE
    sShowText := 'Hot';
END_IF;

sShowText;
END_FUNCTION;
```