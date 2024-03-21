// 8.35s
// 2
VAR
    aiLevel : INT;
    PercentLevel : UINT;
    doLow : BOOL;
    doOk : BOOL;
    doHigh : BOOL;
    doAlarm : BOOL;
END_VAR

CASE aiLevel OF
    (aiLevel <= 327) :
        PercentLevel := 0;
        doLow := TRUE;
        doOk := FALSE;
        doHigh := FALSE;
    (aiLevel > 327 AND aiLevel <= 1638) :
        PercentLevel := (aiLevel - 327) * 100 / (1638 - 327);
        doLow := FALSE;
        doOk := TRUE;
        doHigh := FALSE;
    (aiLevel > 1638 AND aiLevel <= 3111) :
        PercentLevel := (aiLevel - 1638) * 100 / (3111 - 1638);
        doLow := FALSE;
        doOk := TRUE;
        doHigh := FALSE;
    (aiLevel > 3111 AND aiLevel <= 32767) :
        PercentLevel := (aiLevel - 3111) * 100 / (32767 - 3111);
        doLow := FALSE;
        doOk := FALSE;
        doHigh := TRUE;
    TRUE :
        PercentLevel := 100;
        doLow := FALSE;
        doOk := FALSE;
        doHigh := TRUE;
END_CASE;

IF PercentLevel < 1 THEN
    doAlarm := TRUE;
ELSE
    doAlarm := FALSE;
END_IF;
