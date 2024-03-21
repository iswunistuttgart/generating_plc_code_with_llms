// 51.48514986038208s
// 2
```
FUNCTION_BLOCK FillLevelCheck
VAR
    aiLevel : INT;
    PercentLevel : UINT;
    doLow : BOOL;
    doOk : BOOL;
    doHigh : BOOL;
    doAlarm : BOOL;
END_VAR

CASE aiLevel OF
    0..10:
        doLow := TRUE;
        doOk := FALSE;
        doHigh := FALSE;
        doAlarm := FALSE;
    ELSE 20..80:
        doLow := FALSE;
        doOk := TRUE;
        doHigh := FALSE;
        doAlarm := FALSE;
    ELSE 81..100:
        doLow := FALSE;
        doOk := FALSE;
        doHigh := TRUE;
        doAlarm := FALSE;
END_CASE

IF PercentLevel < 1 THEN
    doAlarm := TRUE;
END_IF
```