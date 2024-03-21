// 20.81s
// 4
PROGRAM AlarmsControl
VAR
	xAllOn : BOOL;
	xAllOff : BOOL;
	xAlarm1 : BOOL;
	xAlarm2 : BOOL;
END_VAR

// Main control logic
IF xAllOn THEN
	xAlarm1 := TRUE;
	xAlarm2 := TRUE;
	xAllOn := FALSE; // Turn off the control signal
ELSIF xAllOff THEN
	xAlarm1 := FALSE;
	xAlarm2 := FALSE;
	xAllOff := FALSE; // Turn off the control signal
END_IF;
