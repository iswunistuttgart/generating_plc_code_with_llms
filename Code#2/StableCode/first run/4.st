// 26.283478021621704s
// 2

//IEC 61131-3 Structured Text Program of a Fill Level Check
//Fill level in a container should be monitored in three ranges: low, ok and high
//Use one output each for low, ok and high
//The fill level is read in via an analog value (0 - 32767) and should be converted internally to 0-100%
IF (AI_LEVEL < 0 OR AI_LEVEL > 32767) THEN
    DO_ALARM = TRUE;
END IF
CASE WHEN AI_LEVEL BETWEEN 0 AND 180 THEN
    DO_LOW = TRUE;
ELSE
    DO_OK = TRUE;
END CASE
CASE WHEN AI_LEVEL BETWEEN 180 AND 32767 THEN
    DO_HIGH = TRUE;
END CASE