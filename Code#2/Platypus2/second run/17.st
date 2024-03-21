// 74.978036403656s
// 2
IF (aiOutside < 18) THEN
    sShowText := "Cold";
ELSIF (aiOutside > 25) THEN
    sShowText := "Hot";
ELSE
    IF (aiHumidity BETWEEN 40 AND 75) THEN
        IF (aiOutside BETWEEN 18 AND 25) THEN
            sShowText := "Opt";
        ELSE
            sShowText := "Temp. OK";
    ELSE
        sShowText := "Humidity OK";