// 43.99788689613342s
// 2
```
PROGRAM Alarms
VAR
	xAllOn : BOOL;
	xAllOff : BOOL;

	xAlarm1 : BOOL;
    xAlarm2 : BOOL;
END_VAR

FUNCTION Alarm(xAlarm : BOOL) : BOOL
VAR
	xAlarm : BOOL;
END_VAR
RETURN xAlarm;
END_FUNCTION

PROGRAM
BEGIN
	IF (xAllOn) THEN
		xAlarm1 := TRUE;
		xAlarm2 := TRUE;
	ELSIF (xAllOff) THEN
		xAlarm1 := FALSE;
		xAlarm2 := FALSE;
	END_IF;
END_PROGRAM
```