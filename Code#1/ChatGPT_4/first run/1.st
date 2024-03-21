//29.01s
//4
PROGRAM AlarmControl
VAR
    xAlarm1 : BOOL; (* Variable for Alarm 1 *)
    xAlarm2 : BOOL; (* Variable for Alarm 2 *)
    xAllOn : BOOL; (* Signal to set all alarms on *)
    xAllOff : BOOL; (* Signal to set all alarms off *)
END_VAR

(* Turn on both alarms if xAllOn is activated *)
IF xAllOn THEN
    xAlarm1 := TRUE;
    xAlarm2 := TRUE;
    xAllOn := FALSE; (* Turn off the signal after setting alarms *)
END_IF

(* Turn off both alarms if xAllOff is activated *)
IF xAllOff THEN
    xAlarm1 := FALSE;
    xAlarm2 := FALSE;
    xAllOff := FALSE; (* Turn off the signal after resetting alarms *)
END_IF

END_PROGRAM
