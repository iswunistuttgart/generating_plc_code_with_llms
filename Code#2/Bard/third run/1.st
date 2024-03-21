// 4.56s
// 2
VAR
  xAllOn : BOOL;
  xAllOff : BOOL;

  xAlarm1 : BOOL := FALSE;
  xAlarm2 : BOOL := FALSE;
END_VAR

PROGRAM main

VAR
  tmpSignal : BOOL;
END_VAR

IF xAllOn = TRUE THEN
  xAlarm1 := TRUE;
  xAlarm2 := TRUE;
  xAllOn := FALSE;
END_IF;

IF xAllOff = TRUE THEN
  xAlarm1 := FALSE;
  xAlarm2 := FALSE;
  xAllOff := FALSE;
END_IF;

END_PROGRAM