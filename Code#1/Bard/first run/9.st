//9.16s
// 2
(* Program to check whether a year is a leap year *)

VAR
  YEAR: INT; (* Year to check *)
  isLeapYear: BOOL; (* Flag indicating whether the year is a leap year *)

(* Main program *)
PROGRAM Main
BEGIN
  YEAR := 2020; (* Example year *)
  isLeapYear := ((YEAR MOD 4 = 0) AND (YEAR MOD 100 <> 0)) OR (YEAR MOD 400 = 0);
  IF isLeapYear THEN
    WRITE(YEAR, 'is a leap year');
  ELSE
    WRITE(YEAR, 'is not a leap year');
  END_IF;
END_PROGRAM