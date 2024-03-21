// 7.71s
// 4
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

// Start the one-hour timer when Start_Loop is FALSE
One_Hour_Timer(IN := NOT Start_Loop, PT := one_hour);

// Check if the timer has timed out
IF One_Hour_Timer.Q THEN
    Close_Gate_Inst := TRUE;
    One_Hour_Timer(IN := FALSE); // Reset the timer
END_IF

// Check conditions to open the gate
IF (Sensed_Car AND Sensed_Car_Inst) OR (Sensed_App AND Mobile_Inst AND Auth = my_defined_str) THEN
    Gate_Open := TRUE;
    Close_Gate_Inst := FALSE; // Cancel closing the gate if it's open
END_IF

// Close the gate if required
IF Close_Gate_Inst THEN
    Gate_Open := FALSE;
END_IF
