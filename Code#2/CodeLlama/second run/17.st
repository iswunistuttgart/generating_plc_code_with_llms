// 47.98483920097351s
// 2
```
FUNCTION TEXT_OUTPUT : STRING
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
RETURN sShowText;
END_FUNCTION;
```