// 22.82s
// 2
PROGRAM FillLevelCheck
VAR
    aiLevel : INT; // Analog input level (0 - 32767)
    PercentLevel : UINT; // Level in percent (0 - 100)
    doLow : BOOL; // Output for low level
    doOk : BOOL; // Output for ok level
    doHigh : BOOL; // Output for high level
    doAlarm : BOOL; // Output for alarm
END_VAR

// Convert the analog input to a percentage
PercentLevel := UINT(aiLevel * 100 / 32767);

// Reset outputs
doLow := FALSE;
doOk := FALSE;
doHigh := FALSE;
doAlarm := FALSE;

// Check the level and set outputs accordingly
CASE PercentLevel OF
    0..1: 
    BEGIN
        doLow := TRUE; // Level is low
        doAlarm := TRUE; // Sound alarm
    END
    2..80: 
    BEGIN
        doOk := TRUE; // Level is ok
    END
    81..100: 
    BEGIN
        doHigh := TRUE; // Level is high
    END
END_CASE
