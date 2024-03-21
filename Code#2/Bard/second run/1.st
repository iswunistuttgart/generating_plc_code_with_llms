// 4.31s
// 2
VAR
    xAllOn : BOOL;
    xAllOff : BOOL;

    xAlarm1 : BOOL;
    xAlarm2 : BOOL;
END_VAR

IF xAllOn THEN
    xAlarm1 := TRUE;
    xAlarm2 := TRUE;
    xAllOn := FALSE;
ELSIF xAllOff THEN
    xAlarm1 := FALSE;
    xAlarm2 := FALSE;
    xAllOff := FALSE;
ELSE
END_IF;