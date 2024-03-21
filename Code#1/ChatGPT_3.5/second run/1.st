//5.24s
//2
PROGRAM AlarmControl
VAR
    xAlarm1: BOOL := FALSE;
    xAlarm2: BOOL := FALSE;
    xAllOn: BOOL := FALSE;
    xAllOff: BOOL := FALSE;
END_VAR

METHOD SetAlarms: BOOL
    IF xAllOn THEN
        xAlarm1 := TRUE;
        xAlarm2 := TRUE;
    ELSIF xAllOff THEN
        xAlarm1 := FALSE;
        xAlarm2 := FALSE;
    END_IF
    RETURN TRUE;
END_METHOD

METHOD TurnOffAlarms
    xAlarm1 := FALSE;
    xAlarm2 := FALSE;
END_METHOD

END_PROGRAM
