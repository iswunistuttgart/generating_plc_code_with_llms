// 7.83s
// 2
VAR
  Start_Loop : BOOL := FALSE;
  one_hour : TIME := T#1h;
  One_Hour_Timer : TON;
  Gate_Open : BOOL := FALSE;
  Close_Gate_Inst : BOOL := FALSE;
  Sensed_Car : BOOL := FALSE;
  Sensed_Car_Inst : BOOL := FALSE;
  Sensed_App : BOOL := FALSE;
  Mobile_Inst : BOOL := FALSE;
  Auth : STRING := '';
  my_defined_str : STRING := 'abcd';
END_VAR

PROGRAM main

VAR
  tmpAuth : STRING;
END_VAR

One_Hour_Timer(PT := one_hour);

IF Start_Loop = FALSE THEN
  Start_Loop := TRUE;
  One_Hour_Timer.run;
END_IF;

IF One_Hour_Timer.Q AND Gate_Open = TRUE THEN
  Close_Gate_Inst := TRUE;
END_IF;

IF Sensed_Car = TRUE OR Sensed_App = TRUE THEN
  Sensed_Car_Inst := TRUE;
  tmpAuth := 'abcd';

  IF Auth = tmpAuth THEN
    Gate_Open := TRUE;
    CLOSE_GATE:;
  ELSE
    Gate_Open := FALSE;
  END_IF;
END_IF;

IF Mobile_Inst = TRUE THEN
  Sensed_App := TRUE;
  tmpAuth := 'abcd';

  IF Auth = tmpAuth THEN
    Gate_Open := TRUE;
    CLOSE_GATE:;
  ELSE
    Gate_Open := FALSE;
  END_IF;
END_IF;

END_PROGRAM