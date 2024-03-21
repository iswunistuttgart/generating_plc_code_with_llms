// 77.3076605796814s
// 2
PROGRAM main

VAR
	xAllOn : BOOL;
	xAllOff : BOOL;

	xAlarm1 : BOOL;
    xAlarm2 : BOOL;
END_VAR

BEGIN
	xAllOn := TRUE;
	xAllOff := FALSE;

	xAlarm1 := TRUE;
    xAlarm2 := FALSE;

	IF xAllOn THEN
		xAllOff := FALSE;
	ELSE
		xAllOff := TRUE;

	IF xAllOff THEN
		xAllOn := FALSE;
	ELSE
		xAllOn := TRUE;
END_PROGRAM