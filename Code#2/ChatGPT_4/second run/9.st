// 18.49s
// 4
VAR 
    YEAR : INT;
    IsLeapYear : BOOL;
END_VAR

IsLeapYear := FALSE;  (* Default assumption *)

IF (YEAR MOD 4 = 0) THEN
    IF (YEAR MOD 100 = 0) THEN
        IF (YEAR MOD 400 = 0) THEN
            IsLeapYear := TRUE;  (* Divisible by 400, so it's a leap year *)
        END_IF;
    ELSE
        IsLeapYear := TRUE;  (* Divisible by 4 but not by 100, so it's a leap year *)
    END_IF;
END_IF;
