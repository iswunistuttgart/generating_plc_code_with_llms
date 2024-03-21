// 5.72s
// 2
VAR 
    YEAR : INT;
END_VAR

IF (YEAR MOD 4 = 0 AND YEAR MOD 100 <> 0) OR (YEAR MOD 400 = 0) THEN
    // Leap year conditions:
    // - If divisible by 4 but not by 100
    // - If divisible by 400
    // It is a leap year
    // Implement your logic for a leap year here, e.g., set a variable or perform specific actions
ELSE
    // Not a leap year
    // Implement your logic for a non-leap year here, if needed
END_IF
