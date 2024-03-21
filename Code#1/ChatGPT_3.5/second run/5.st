//10.68s
//2
PROGRAM GateController
VAR
    Start_Loop: BOOL := TRUE;  // Start the loop (initially TRUE)
    One_Hour_Timer: TIME := T#1H;  // One-hour timer
    Gate_Open: BOOL := FALSE;  // Gate status (initially closed)
    Auth_String: STRING := "my_defined_str";  // Expected authentication string
    App_Presence: BOOL := FALSE;  // App presence indicator
    Car_Presence: BOOL := FALSE;  // Car presence indicator
END_VAR

BEGIN
    // If the timer is not running and Start_Loop is FALSE, start the timer
    IF NOT One_Hour_Timer.RUNNING AND NOT Start_Loop THEN
        One_Hour_Timer(IN := TRUE);
    END_IF

    // Check if the timer has timed out and the gate is open
    IF One_Hour_Timer.Q AND Gate_Open THEN
        Gate_Open := FALSE;  // Close the gate
    END_IF

    // Check for authentication conditions (app presence and matching Auth_String)
    IF App_Presence AND Auth_String = "my_defined_str" THEN
        Gate_Open := TRUE;  // Open the gate
    END_IF
END_PROGRAM
