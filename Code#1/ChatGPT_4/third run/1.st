//18.66s
//4
PROGRAM AlarmControl
    VAR
        xAlarm1 : BOOL; // Alarm 1
        xAlarm2 : BOOL; // Alarm 2
        xAllOn  : BOOL; // Signal to turn all alarms on
        xAllOff : BOOL; // Signal to turn all alarms off
    END_VAR

    // Turn on both alarms if xAllOn is activated
    IF xAllOn THEN
        xAlarm1 := TRUE;
        xAlarm2 := TRUE;
        xAllOn := FALSE; // Reset the signal
    END_IF

    // Turn off both alarms if xAllOff is activated
    IF xAllOff THEN
        xAlarm1 := FALSE;
        xAlarm2 := FALSE;
        xAllOff := FALSE; // Reset the signal
    END_IF
END_PROGRAM
