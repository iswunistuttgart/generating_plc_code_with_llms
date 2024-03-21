// 7.06s
// 2
VAR
    aiLevel : INT;
    PercentLevel : UINT;
    doLow : BOOL;
    doOk : BOOL;
    doHigh : BOOL;
    doAlarm : BOOL;
END_VAR

aiLevel := ... // Read the analog input level (0 - 32767) from your system

// Convert analog input to percentage (0 - 100%)
PercentLevel := UINT_TO(aiLevel * 100 / 32767);

CASE PercentLevel OF
    (PercentLevel < 1):
        doLow := TRUE;
        doOk := FALSE;
        doHigh := FALSE;
        doAlarm := TRUE; // Activate the warning horn
    (PercentLevel >= 1 AND PercentLevel <= 75):
        doLow := FALSE;
        doOk := TRUE;
        doHigh := FALSE;
        doAlarm := FALSE;
    (PercentLevel > 75):
        doLow := FALSE;
        doOk := FALSE;
        doHigh := TRUE;
        doAlarm := FALSE;
END_CASE
