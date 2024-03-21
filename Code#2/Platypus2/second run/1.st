// 71.16442847251892s
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
		xAllOff := FALSE;
	ELSE
		xAllOff := TRUE;

	IF xAllOff THEN
		xAllOn := FALSE;
	ELSE
		xAllOn := TRUE;
END_PROGRAM