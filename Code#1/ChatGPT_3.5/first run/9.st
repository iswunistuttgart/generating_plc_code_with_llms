//7.57s
//4
PROGRAM LeapYearChecker
VAR
    YEAR: INT := 2024;  // Replace with the year you want to check
    IsLeapYear: BOOL := FALSE;
END_VAR

IF (YEAR MOD 4 = 0) AND ((YEAR MOD 100 <> 0) OR (YEAR MOD 400 = 0)) THEN
    IsLeapYear := TRUE;
ELSE
    IsLeapYear := FALSE;
END_IF

// Now you can use the IsLeapYear variable to determine if the year is a leap year or not

END_PROGRAM
