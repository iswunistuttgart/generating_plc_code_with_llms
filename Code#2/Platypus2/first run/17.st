// 70.54809927940369s
// 2
IF (aiOutside < 18) THEN
    sShowText := "Cold";
ELSIF (aiOutside >= 18 AND aiOutside <= 25) THEN
    IF (aiHumidity BETWEEN 40 AND 75) THEN
        sShowText := "Opt";
    ELSE
        sShowText := "Temp. OK";
ELSE
    sShowText := "Hot";
END_IF;