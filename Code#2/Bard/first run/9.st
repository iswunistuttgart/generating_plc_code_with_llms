// 6.98s
// 2
VAR
    YEAR : INT;
END_VAR

START

    IF (YEAR % 4 = 0) AND (YEAR % 100 <> 0) OR (YEAR % 400 = 0) THEN
        LeapYear := TRUE;
    ELSE
        LeapYear := FALSE;
    END_IF;
END_START