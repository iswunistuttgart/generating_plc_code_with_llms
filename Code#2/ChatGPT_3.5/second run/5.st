// 7.51s
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

// Main control logic
IF NOT Start_Loop THEN
    // Start the one-hour timer when Start_Loop is FALSE
    One_Hour_Timer(IN := NOT Gate_Open AND NOT Close_Gate_Inst, PT := one_hour);
    
    // Check if the timer timed out
    IF One_Hour_Timer.Q THEN
        Close_Gate_Inst := TRUE;
    END_IF;

    // Check for sensed car or app with matching Auth string
    IF (Sensed_Car AND NOT Sensed_Car_Inst) OR (Sensed_App AND Mobile_Inst AND Auth = my_defined_str) THEN
        Gate_Open := TRUE;
        Close_Gate_Inst := FALSE;
    END_IF;

    // Reset the timer if the gate is open
    IF Gate_Open THEN
        One_Hour_Timer(IN := FALSE);
    END_IF;
ELSE
    // Reset the timer when Start_Loop is TRUE
    One_Hour_Timer(IN := FALSE);
    Close_Gate_Inst := FALSE;
    Gate_Open := FALSE;
END_IF
