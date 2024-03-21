// 20.46s
// 4
VAR
    YEAR : INT; // Input Year
    IsLeapYear : BOOL; // Output: TRUE if leap year, FALSE otherwise
END_VAR

// Check if the year is a leap year
IsLeapYear := FALSE; // Default to false

IF (YEAR MOD 4 = 0) THEN
    IF (YEAR MOD 100 = 0) THEN
        IF (YEAR MOD 400 = 0) THEN
            IsLeapYear := TRUE; // Leap year if divisible by 400
        END_IF;
    ELSE
        IsLeapYear := TRUE; // Leap year if divisible by 4 but not by 100
    END_IF;
END_IF;
