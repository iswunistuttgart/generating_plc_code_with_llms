// 5.28s
// 2
VAR
  YEAR : INT;
  isLeapYear : BOOL;
END_VAR

isLeapYear := FALSE;

IF (YEAR % 4 = 0) AND (YEAR % 100 <> 0) OR (YEAR % 400 = 0) THEN
  isLeapYear := TRUE;
END_IF;

Write_To_Display("Is the year ", YEAR, " a leap year?", isLeapYear);