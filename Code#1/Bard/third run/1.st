//5.95s
//3
PROGRAM MyProgram

VAR
  xAlarm1: BOOL;
  xAlarm2: BOOL;
  xAllOn: BOOL;
  xAllOff: BOOL;

BEGIN

  IF xAllOn THEN
    xAlarm1 := TRUE;
    xAlarm2 := TRUE;
  ELSIF xAllOff THEN
    xAlarm1 := FALSE;
    xAlarm2 := FALSE;
  ELSE
    // Process alarm conditions
  END_IF;

END_PROGRAM