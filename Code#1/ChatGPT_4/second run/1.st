//16.57s
//4
PROGRAM AlarmControl
VAR
    xAlarm1: BOOL; // Alarm 1
    xAlarm2: BOOL; // Alarm 2
    xAllOn: BOOL;  // Signal to set all alarms
    xAllOff: BOOL; // Signal to reset all alarms
END_VAR

// When the xAllOn signal is active, set both alarms to TRUE
IF xAllOn THEN
    xAlarm1 := TRUE;
    xAlarm2 := TRUE;
    // Reset the signals after processing
    xAllOn := FALSE;
END_IF

// When the xAllOff signal is active, set both alarms to FALSE
IF xAllOff THEN
    xAlarm1 := FALSE;
    xAlarm2 := FALSE;
    // Reset the signals after processing
    xAllOff := FALSE;
END_IF

END_PROGRAM
