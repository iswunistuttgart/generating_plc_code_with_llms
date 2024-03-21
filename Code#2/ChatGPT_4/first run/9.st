// 23.95s
// 4
PROGRAM LeapYearCheck
VAR 
    YEAR : INT;
    IsLeapYear : BOOL;
END_VAR

IsLeapYear := FALSE; // Initialize to false

IF (YEAR MOD 4 = 0) AND ((YEAR MOD 100 <> 0) OR (YEAR MOD 400 = 0)) THEN
    IsLeapYear := TRUE;
ELSE
    IsLeapYear := FALSE;
END_IF;
