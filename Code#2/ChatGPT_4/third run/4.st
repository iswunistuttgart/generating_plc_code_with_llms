// 26.36s
// 2
VAR
    aiLevel : INT;     // Analog input for fill level
    PercentLevel : UINT; // Converted fill level in percentage
    doLow : BOOL;      // Output for low fill level
    doOk : BOOL;       // Output for ok fill level
    doHigh : BOOL;     // Output for high fill level
    doAlarm : BOOL;    // Output for warning horn
END_VAR

// Convert analog input to percentage
PercentLevel := UINT((REAL(aiLevel) / 32767) * 100);

// Reset outputs
doLow := FALSE;
doOk := FALSE;
doHigh := FALSE;

// Check fill level and set outputs accordingly
CASE PercentLevel OF
    0..1: 
    BEGIN
        doLow := TRUE;
        doAlarm := TRUE; // Activate alarm if level is below 1%
    END
    2..75: 
    BEGIN
        doOk := TRUE;
    END
    76..100: 
    BEGIN
        doHigh := TRUE;
    END
END_CASE;
