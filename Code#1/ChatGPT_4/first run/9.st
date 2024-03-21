//31.7s
//4
PROGRAM LeapYearCheck
VAR
    YEAR : INT; (* Input: Year to check *)
    IsLeapYear : BOOL; (* Output: TRUE if YEAR is a leap year, otherwise FALSE *)
END_VAR

(* A year is a leap year if it is divisible by 4 but not by 100, unless it is also divisible by 400 *)
IsLeapYear := (YEAR MOD 4 = 0) AND ((YEAR MOD 100 <> 0) OR (YEAR MOD 400 = 0));

END_PROGRAM
