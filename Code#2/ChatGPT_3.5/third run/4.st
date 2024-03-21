// 6.26s
// 2
VAR
    aiLevel : INT;
    PercentLevel : UINT;
    doLow : BOOL;
    doOk : BOOL;
    doHigh : BOOL;
    doAlarm : BOOL;
END_VAR

// Read analog input for fill level (0 - 32767)
aiLevel := ... // Read the actual analog input value from your sensor

// Convert to percentage
PercentLevel := UINT_TO((aiLevel * 100) / 32767);

// Initialize output variables
doLow := FALSE;
doOk := FALSE;
doHigh := FALSE;
doAlarm := FALSE;

// Check fill level ranges using CASE instruction
CASE PercentLevel OF
    0 TO 1:
        doLow := TRUE;
        doAlarm := TRUE;
    2 TO 70:
        doOk := TRUE;
    71 TO 100:
        doHigh := TRUE;
END_CASE
