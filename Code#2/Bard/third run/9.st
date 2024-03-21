// 6.25s
// 2
VAR
  YEAR : INT;
  isLeapYear : BOOL;
END_VAR

PROGRAM main

isLeapYear := FALSE;

IF YEAR % 4 = 0 AND YEAR % 100 <> 0 THEN
  isLeapYear := TRUE;

ELSIF YEAR % 400 = 0 THEN
  isLeapYear := TRUE;
ENDIF;

WRITE("YEAR: " & INT_TO_STRING(YEAR) & " is a leap year?: " & BOOL_TO_STRING(isLeapYear));

END_PROGRAM