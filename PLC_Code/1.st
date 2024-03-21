VAR
	xAllOn : BOOL;
	xAllOff : BOOL;

	xAlarm1 : BOOL;
    xAlarm2 : BOOL;
END_VAR

IF xAllOn THEN
	xAllOn := FALSE;
	
	xAlarm1 := TRUE;
	xAlarm2 := TRUE;
END_IF

IF xAllOff THEN
	xAllOff := FALSE;
	
	xAlarm1 := FALSE;
    xAlarm2 := FALSE;
END_IF