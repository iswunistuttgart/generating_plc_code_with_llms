// 6.9s
// 3
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

One_Hour_Timer(IN := NOT Start_Loop, PT := one_hour);
Close_Gate_Inst := One_Hour_Timer.Q;

IF Close_Gate_Inst THEN
    IF Gate_Open THEN
        Gate_Open := FALSE;
    END_IF;
END_IF;

IF Sensed_Car AND Sensed_Car_Inst AND Auth = my_defined_str THEN
    Gate_Open := TRUE;
END_IF;

IF Sensed_App AND Mobile_Inst AND Auth = my_defined_str THEN
    Gate_Open := TRUE;
END_IF;
