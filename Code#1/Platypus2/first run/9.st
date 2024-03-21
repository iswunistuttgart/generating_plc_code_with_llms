// 27.468589544296265s
// 2
IF (YEAR MOD 4 = 0) AND (YEAR MOD 100 <> 0) OR (YEAR MOD 400 = 0) THEN
    PRINT "Year ", YEAR, " is a leap year.";
ELSE
    PRINT "Year ", YEAR, " is not a leap year.";
ENDIF