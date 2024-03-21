// 5.73s
//3
PROGRAM AlarmControl
VAR
    xAlarm1: BOOL := FALSE;
    xAlarm2: BOOL := FALSE;
    xAllOn: BOOL := FALSE;
    xAllOff: BOOL := FALSE;
END_VAR

xAlarm1 := FALSE;  // Ensure alarms are initially turned off
xAlarm2 := FALSE;

IF xAllOn THEN
    xAlarm1 := TRUE;
    xAlarm2 := TRUE;
ELSIF xAllOff THEN
    xAlarm1 := FALSE;
    xAlarm2 := FALSE;
END_IF

// Rest of your program logic here

END_PROGRAM
