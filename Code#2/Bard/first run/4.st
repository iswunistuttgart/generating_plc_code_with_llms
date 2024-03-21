// 6.45s
// 2
VAR
    aiLevel : INT;
    PercentLevel : UINT;
    doLow : BOOL;
    doOk : BOOL;
    doHigh : BOOL;
    doAlarm : BOOL;
END_VAR

START

    READ_ANALOG aiLevel;

    IF aiLevel < 0 THEN
        PercentLevel := 0;
    ELSE
        IF aiLevel > 32767 THEN
            PercentLevel := 100;
        ELSE
            PercentLevel := INT((aiLevel) * 100 / 32767);
        END_IF;
    END_IF;

    CASE PercentLevel
        WHEN 0..25 THEN
            doLow := TRUE;
            doOk := FALSE;
            doHigh := FALSE;
            doAlarm := FALSE;
        WHEN 26..75 THEN
            doLow := FALSE;
            doOk := TRUE;
            doHigh := FALSE;
            doAlarm := FALSE;
        WHEN 76..100 THEN
            doLow := FALSE;
            doOk := FALSE;
            doHigh := TRUE;
            doAlarm := FALSE;
        ELSE
            doLow := FALSE;
            doOk := FALSE;
            doHigh := FALSE;
            doAlarm := TRUE;
    END_CASE;

END_START