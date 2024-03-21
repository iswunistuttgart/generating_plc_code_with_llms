//21.55s
//4
PROGRAM LeapYearCheck
VAR
    YEAR : INT; // Variable holding the year to check
    IsLeapYear : BOOL; // Boolean variable indicating if it's a leap year
END_VAR

// Calculate if YEAR is a leap year
IsLeapYear := (YEAR MOD 4 = 0) AND ((YEAR MOD 100 <> 0) OR (YEAR MOD 400 = 0));

END_PROGRAM
