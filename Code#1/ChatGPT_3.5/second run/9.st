//7.03s
//4
PROGRAM LeapYearCheck
VAR
    YEAR: INT;  // Input year to be checked
    IsLeapYear: BOOL := FALSE;  // Output indicating if it's a leap year
END_VAR

BEGIN
    // Check if the given year is a leap year
    IF (YEAR MOD 4 = 0) AND ((YEAR MOD 100 <> 0) OR (YEAR MOD 400 = 0)) THEN
        IsLeapYear := TRUE;
    ELSE
        IsLeapYear := FALSE;
    END_IF
END_PROGRAM
