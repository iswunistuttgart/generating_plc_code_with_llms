//5.93s
//3
(* Program to manage two alarms *)

VAR
  xAlarm1: BOOL; (* Alarm 1 status *)
  xAlarm2: BOOL; (* Alarm 2 status *)
  xAllOn: BOOL; (* Set all alarms on *)
  xAllOff: BOOL; (* Set all alarms off *)

(* Main program *)
PROGRAM Main
BEGIN
  IF xAllOn THEN
    xAlarm1 := TRUE;
    xAlarm2 := TRUE;
  ELSIF xAllOff THEN
    xAlarm1 := FALSE;
    xAlarm2 := FALSE;
  END_IF;
END_PROGRAM