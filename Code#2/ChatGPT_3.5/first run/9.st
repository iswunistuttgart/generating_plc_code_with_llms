// 5.58s
// 3
VAR 
    YEAR : INT;
END_VAR

VAR
    isLeapYear : BOOL := FALSE;
END_VAR

(* Check if the year is a leap year *)
IF YEAR MOD 4 = 0 THEN
    IF YEAR MOD 100 = 0 THEN
        IF YEAR MOD 400 = 0 THEN
            isLeapYear := TRUE;
        END_IF;
    ELSE
        isLeapYear := TRUE;
    END_IF;
END_IF;
