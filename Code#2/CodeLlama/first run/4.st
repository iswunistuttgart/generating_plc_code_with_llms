// 45.75422644615173s
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
    ELSE 20..80:
        doLow := FALSE;
        doOk := TRUE;
        doHigh := FALSE;
    ELSE
        doLow := FALSE;
        doOk := FALSE;
        doHigh := TRUE;
END_CASE

IF PercentLevel < 1 THEN
    doAlarm := TRUE;
ELSE
    doAlarm := FALSE;
END_IF;
```