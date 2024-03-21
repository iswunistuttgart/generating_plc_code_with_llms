// 52.79196882247925s
// 2
IF (YEAR MOD 4 = 0) THEN
    IF (YEAR MOD 100 = 0) THEN
        IF (YEAR MOD 400 = 0) THEN
            PRINT "Year is a leap year"
        ELSE
            PRINT "Year is not a leap year"
        END_IF
    ELSE
        PRINT "Year is not a leap year"
    END_IF
ELSE
    PRINT "Year is not a leap year"
END_IF