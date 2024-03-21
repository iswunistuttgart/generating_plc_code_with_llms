// 48.220186948776245s
// 2
```
PROGRAM Alarms
VAR
	xAllOn : BOOL := FALSE;
	xAllOff : BOOL := FALSE;

	xAlarm1 : BOOL := FALSE;
    xAlarm2 : BOOL := FALSE;
END_VAR

IF (xAllOn) THEN
	xAlarm1 := TRUE;
	xAlarm2 := TRUE;
ELSIF (xAllOff) THEN
	xAlarm1 := FALSE;
	xAlarm2 := FALSE;
ELSE
	CASE xAllOn OF
		TRUE : xAlarm1 := TRUE;
		FALSE : xAlarm1 := FALSE;
	END_CASE;
	CASE xAllOff OF
		TRUE : xAlarm2 := TRUE;
		FALSE : xAlarm2 := FALSE;
	END_CASE;
END_IF;
ENDPROGRAM
```