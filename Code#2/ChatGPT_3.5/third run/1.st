// 5.64s
// 3
VAR
    xAllOn : BOOL;
    xAllOff : BOOL;

    xAlarm1 : BOOL;
    xAlarm2 : BOOL;
END_VAR

xAllOn := FALSE;  // Initializing the signals
xAllOff := FALSE;

// Set all alarms to TRUE and turn off the signal
IF xAllOn THEN
    xAlarm1 := TRUE;
    xAlarm2 := TRUE;
    xAllOn := FALSE;
END_IF

// Set all alarms to FALSE and turn off the signal
IF xAllOff THEN
    xAlarm1 := FALSE;
    xAlarm2 := FALSE;
    xAllOff := FALSE;
END_IF
