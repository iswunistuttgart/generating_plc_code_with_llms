//7.42s
//2
PROGRAM LeapYearCheck
VAR_INPUT
    YEAR: INT; // Input year to check
END_VAR

VAR_OUTPUT
    IsLeapYear: BOOL; // Output indicating whether the year is a leap year
END_VAR

METHOD CheckLeapYear
    IF ((YEAR MOD 4 = 0) AND (YEAR MOD 100 <> 0)) OR (YEAR MOD 400 = 0) THEN
        IsLeapYear := TRUE; // It's a leap year
    ELSE
        IsLeapYear := FALSE; // It's not a leap year
    END_IF
END_METHOD

END_PROGRAM
