// 4.98s
// 2
VAR
    YEAR : INT;
END_VAR

// Check if the year is a leap year
IF (YEAR MOD 4 = 0 AND YEAR MOD 100 <> 0) OR (YEAR MOD 400 = 0) THEN
    // The year is a leap year
    // You can add your logic here for leap year
ELSE
    // The year is not a leap year
    // You can add your logic here for non-leap year
END_IF
