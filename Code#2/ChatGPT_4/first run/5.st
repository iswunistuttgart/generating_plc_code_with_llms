// 32.46s
// 2
PROGRAM GateController
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

// Timer control
IF NOT Start_Loop THEN
    One_Hour_Timer(IN := TRUE, PT := one_hour);
ELSE
    One_Hour_Timer.IN := FALSE;
END_IF
One_Hour_Timer.Q := One_Hour_Timer.IN AND (One_Hour_Timer.ET >= one_hour);

// Close gate if timer timed out and gate is open
IF One_Hour_Timer.Q AND Gate_Open THEN
    Close_Gate_Inst := TRUE;
    Gate_Open := FALSE;
END_IF

// Open gate if car or app is sensed and auth string matches
IF (Sensed_Car AND Auth = my_defined_str) OR (Sensed_App AND Auth = my_defined_str) THEN
    Gate_Open := TRUE;
    One_Hour_Timer(IN := FALSE, PT := one_hour); // Reset timer
END_IF
