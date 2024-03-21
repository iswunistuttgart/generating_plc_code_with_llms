//6.87s
//2
PROGRAM AlarmControl
VAR
    xAlarm1: BOOL := FALSE;
    xAlarm2: BOOL := FALSE;
    xAllOn: BOOL := FALSE;
    xAllOff: BOOL := FALSE;
END_VAR

METHOD TurnAllAlarmsOff : BOOL
    xAlarm1 := FALSE;
    xAlarm2 := FALSE;
    RETURN TRUE;
END_METHOD

METHOD TurnAllAlarmsOn : BOOL
    xAlarm1 := TRUE;
    xAlarm2 := TRUE;
    RETURN TRUE;
END_METHOD

IF xAllOn THEN
    TurnAllAlarmsOn();
    xAllOn := FALSE;  // Reset the signal
ELSIF xAllOff THEN
    TurnAllAlarmsOff();
    xAllOff := FALSE; // Reset the signal
END_IF
