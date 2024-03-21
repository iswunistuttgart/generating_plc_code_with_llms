// 48.49951720237732s
// 2
```
FUNCTION TEXT_OUTPUT
VAR
    iTemp : INT;
    iHumidity : INT;
END_VAR
iTemp := aiOutside;
iHumidity := aiHumidity;
IF (iTemp < 18) THEN
    sShowText := "Cold";
ELSIF (iTemp >= 18 AND iTemp <= 25) THEN
    IF (iHumidity >= 40 AND iHumidity <= 75) THEN
        sShowText := "Opt";
    ELSE
        sShowText := "Temp. OK";
    END_IF;
ELSE
    sShowText := "Hot";
END_IF;
sShowText;
END_FUNCTION;
```