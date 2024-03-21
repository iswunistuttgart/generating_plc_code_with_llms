// 75.09014320373535s
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

	xAlarm1 := FALSE;
    xAlarm2 := TRUE;

	IF xAllOn THEN
		xAlarm1 := TRUE;
	ELSE
		xAlarm1 := FALSE;

	IF xAllOff THEN
		xAlarm2 := FALSE;
	ELSE
		xAlarm2 := TRUE;
END_PROGRAM