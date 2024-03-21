// 7.22s
// 4
VAR
    aiOutside : INT;
    aiHumidity: INT;
    sShowText : STRING[80];
END_VAR

// Read temperature and humidity values (replace with actual input values)
aiOutside := ...;
aiHumidity := ...;

// Evaluate temperature
IF aiOutside < 18 THEN
    sShowText := 'Cold';
ELSIF aiOutside >= 18 AND aiOutside <= 25 THEN
    // Evaluate humidity within the nested IF
    IF aiHumidity >= 40 AND aiHumidity <= 75 THEN
        sShowText := 'Opt';
    ELSE
        sShowText := 'Temp. OK';
    END_IF;
ELSE
    sShowText := 'Hot';
END_IF;
