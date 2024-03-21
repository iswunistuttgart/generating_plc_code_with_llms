// 52.24701428413391s
// 2
```
PROGRAM fillLevelCheck
VAR
    aiLevel : INT;
    PercentLevel : UINT;
    doLow : BOOL;
    doOk : BOOL;
    doHigh : BOOL;
    doAlarm : BOOL;
END_VAR

CASE aiLevel OF
    0..10: doLow := TRUE; doOk := FALSE; doHigh := FALSE;
    11..30: doLow := FALSE; doOk := TRUE; doHigh := FALSE;
    ELSE: doLow := FALSE; doOk := FALSE; doHigh := TRUE;
END_CASE

IF PercentLevel < 1 THEN
    doAlarm := TRUE;
END_IF

IF doLow THEN
    OUTPUT('LOW');
ELSIF doOk THEN
    OUTPUT('OK');
ELSIF doHigh THEN
    OUTPUT('HIGH');
ELSE
    OUTPUT('ALARM');
END_IF

END_PROGRAM
```