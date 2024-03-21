// 28.12s
// 4
VAR
    aiOutside : INT; // Analog input for temperature (assumed scaled to °C)
    aiHumidity : INT; // Analog input for humidity (assumed scaled to %)
    sShowText : STRING[80]; // String to display the status
END_VAR

// Evaluating temperature and humidity
IF aiOutside < 18 THEN
    sShowText := 'Cold';
ELSIF aiOutside >= 18 AND aiOutside <= 25 THEN
    // Nested IF for humidity check within optimal temperature range
    IF aiHumidity >= 40 AND aiHumidity <= 75 THEN
        sShowText := 'Opt';
    ELSE
        sShowText := 'Temp. OK';
    END_IF;
ELSIF aiOutside > 25 THEN
    sShowText := 'Hot';
ELSE
    sShowText := 'Temp. OK'; // Default message in case of unexpected values
END_IF;
