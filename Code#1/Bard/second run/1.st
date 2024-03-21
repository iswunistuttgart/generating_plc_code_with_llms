//6.42s
//3
PROGRAM AlarmProgram
VAR
  xAlarm1: BOOL;
  xAlarm2: BOOL;
  xAllOn: BOOL;
  xAllOff: BOOL;
END_VAR

(* Set all alarms to TRUE *)
IF xAllOn THEN
  xAlarm1 := TRUE;
  xAlarm2 := TRUE;
END_IF;

(* Set all alarms to FALSE *)
IF xAllOff THEN
  xAlarm1 := FALSE;
  xAlarm2 := FALSE;
END_IF;

(* Turn off all alarms *)
xAlarm1 := FALSE;
xAlarm2 := FALSE;
END_PROGRAM
