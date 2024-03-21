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

One_Hour_Timer(IN := NOT(Start_Loop), PT := one_hour);

IF One_Hour_Timer.Q THEN
  IF Gate_Open THEN
    Close_Gate_Inst := TRUE;
    Gate_Open := FALSE;
  END_IF;
END_IF;

IF Sensed_App THEN
  IF Auth = my_defined_str THEN
    Close_Gate_Inst := Mobile_Inst XOR Gate_Open;
    Gate_Open := Mobile_Inst;
  END_IF;
END_IF;

IF Sensed_Car THEN
  IF Auth = my_defined_str THEN
    Close_Gate_Inst := Sensed_Car_Inst XOR Gate_Open;
    Gate_Open := Sensed_Car_Inst;
  END_IF;
END_IF;


Start_Loop := One_Hour_Timer.Q;
