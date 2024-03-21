// 5.13s
// 4
VAR
    xAllOn : BOOL;
    xAllOff : BOOL;

    xAlarm1 : BOOL;
    xAlarm2 : BOOL;
END_VAR

START

    IF xAllOn THEN
        xAlarm1 := TRUE;
        xAlarm2 := TRUE;
        xAllOn := FALSE;
    END_IF;

    IF xAllOff THEN
        xAlarm1 := FALSE;
        xAlarm2 := FALSE;
        xAllOff := FALSE;
    END_IF;

END_START