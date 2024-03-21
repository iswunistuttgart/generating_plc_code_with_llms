// 6.33s
// 4
VAR
    aiOutside : INT;
    aiHumidity : INT;
    sShowText : STRING[80];
END_VAR

// Assume aiOutside represents temperature and aiHumidity represents humidity

// Evaluate temperature
IF aiOutside < 18 THEN
    sShowText := 'Cold';
ELSIF aiOutside >= 18 AND aiOutside <= 25 THEN
    // Evaluate humidity for the "Opt" condition
    IF aiHumidity >= 40 AND aiHumidity <= 75 THEN
        sShowText := 'Opt';
    ELSE
        sShowText := 'Temp. OK';
    END_IF;
ELSE
    sShowText := 'Hot';
END_IF;
