//7.66s
// 2
PROGRAM LeapYearChecker

VAR
  YEAR: INT;
  isLeapYear: BOOL;

BEGIN

  // Check if the year is divisible by 4
  IF YEAR MOD 4 = 0 THEN
    // Check if the year is also divisible by 100
    IF YEAR MOD 100 = 0 THEN
      // Check if the year is also divisible by 400
      IF YEAR MOD 400 = 0 THEN
        isLeapYear := TRUE;
      ELSE
        isLeapYear := FALSE;
      END_IF;
    ELSE
      isLeapYear := TRUE;
    END_IF;
  ELSE
    isLeapYear := FALSE;
  END_IF;

  // Output the result
  IF isLeapYear THEN
    WRITE_STRING('The year ' + STRING(YEAR) + ' is a leap year.');
  ELSE
    WRITE_STRING('The year ' + STRING(YEAR) + ' is not a leap year.');
  END_IF;

END_PROGRAM