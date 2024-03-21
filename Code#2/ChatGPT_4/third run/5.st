// 32.03s
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

// Timer control
IF NOT Start_Loop THEN
    One_Hour_Timer(IN := TRUE, PT := one_hour);
ELSE
    One_Hour_Timer(IN := FALSE);
END_IF;

// Check if timer has timed out and the gate is open
IF One_Hour_Timer.Q AND Gate_Open THEN
    Close_Gate_Inst := TRUE; // Instruction to close the gate
    Gate_Open := FALSE; // Gate is now closed
ELSE
    Close_Gate_Inst := FALSE;
END_IF;

// Check for car or app and validate authentication
IF (Sensed_Car OR Sensed_App) AND (Auth = my_defined_str) THEN
    Gate_Open := TRUE; // Open the gate
ELSE
    Sensed_Car_Inst := FALSE;
    Mobile_Inst := FALSE;
END_IF;
