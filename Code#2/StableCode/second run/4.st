// 31.11929750442505s
// 2
//IEC 61131-3 Structured Text Program of a Fill Level Check
//Fill level in a container should be monitored in three ranges: low, ok and high
//Use one output each for low, ok and high
//The fill level is read in via an analog value (0 - 32767) and should be converted internally to 0-100%
IF PercentLevel <= 1 THEN
    IF doAlarm THEN
        PlaySound("Warning", SND_FILENAME|SND_ASYNC);
    END IF;
END IF;
CASE aiLevel
    WHEN 0 THEN
        doLow := TRUE;
        doOk := FALSE;
        doHigh := FALSE;
    WHEN 32767 THEN
        doLow := FALSE;
        doOk := TRUE;
        doHigh := FALSE;
    WHEN 65534 THEN
        doLow := FALSE;
        doOk := FALSE;
        doHigh := TRUE;
    ELSE
        doLow := FALSE;
        doOk := FALSE;
        doHigh := FALSE;
    END CASE;