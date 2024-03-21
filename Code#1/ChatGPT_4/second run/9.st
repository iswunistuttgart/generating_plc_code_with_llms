//22.72s
//4
PROGRAM LeapYearCheck
VAR
    YEAR: INT; // The year to check
    IsLeapYear: BOOL; // Output: TRUE if 'YEAR' is a leap year, otherwise FALSE
END_VAR

// Check if the year is a leap year
IsLeapYear := FALSE; // Initialize as FALSE

IF (YEAR MOD 4 = 0) THEN
    IF (YEAR MOD 100 = 0) THEN
        IF (YEAR MOD 400 = 0) THEN
            IsLeapYear := TRUE; // Year is divisible by 400, it's a leap year
        END_IF;
    ELSE
        IsLeapYear := TRUE; // Year is not a century and is divisible by 4, it's a leap year
    END_IF;
END_IF;

END_PROGRAM
