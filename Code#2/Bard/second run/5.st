// 5.94s
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
  Auth : STRING;
  my_defined_str : STRING := 'abcd';
END_VAR

One_Hour_Timer(PT := one_hour);

IF Start_Loop THEN
  One_Hour_Timer := 0;
END_IF;

IF One_Hour_Timer = 0 AND Gate_Open THEN
  Close_Gate_Inst := TRUE;
END_IF;

IF Sensed_Car OR Sensed_App THEN
  Sensed_Car_Inst := TRUE;
  Mobile_Inst := TRUE;
  IF Input_Auth := Auth AND Auth = my_defined_str THEN
    Gate_Open := TRUE;
    Close_Gate_Inst := FALSE;
    One_Hour_Timer := 0;
  ELSE
    Gate_Open := FALSE;
  END_IF;
END_IF;

IF Sensed_Car_Inst OR Mobile_Inst THEN
  Sensed_Car_Inst := FALSE;
  Mobile_Inst := FALSE;
  IF Gate_Open THEN
    Close_Gate_Inst := TRUE;
  END_IF;
END_IF;