VAR
    aiLevel : INT;
    PercentLevel : UINT;
    doLow : BOOL;
    doOk : BOOL;
    doHigh : BOOL;
    doAlarm : BOOL;
END_VAR

(*scaling the analog input to percent*)
PercentLevel := INT_TO_UINT(aiLevel / 327);
(*reset all outputs*)
doAlarm := FALSE;
doLow := FALSE;
doOk := FALSE;
doHigh := FALSE;

CASE PercentLevel OF
    0: (*-- level alarm*)
        doAlarm := TRUE;
        doLow := TRUE;
    1..24: (*-- level is low*)
        doLow := TRUE;
    25..90:(*-- level is ok*)
        doOk := TRUE;
    ELSE (*-- level is high*)
        doHigh := TRUE;
END_CASE
