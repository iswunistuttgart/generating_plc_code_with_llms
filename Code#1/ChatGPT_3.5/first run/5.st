//11.55s
//2
PROGRAM GateController
VAR
    Start_Loop: BOOL := TRUE;          // Start/Stop the loop
    One_Hour_Timer: TIME := T#1H;     // 1-hour timer
    Gate_Open: BOOL := FALSE;         // Gate status (initially closed)
    Auth_String: STRING := "my_defined_str";  // Authentication string
    App_Presence: BOOL := FALSE;       // App presence signal
    Car_Presence: BOOL := FALSE;       // Car presence signal
END_VAR

IF NOT Start_Loop THEN
    One_Hour_Timer := One_Hour_Timer - T#1S;  // Decrement the timer by 1 second
END_IF

IF One_Hour_Timer <= T#0S THEN
    IF Gate_Open THEN
        Gate_Open := FALSE;  // Close the gate as the timer has timed out
    END_IF
END_IF

IF (App_Presence OR Car_Presence) AND (Auth_String = "my_defined_str") THEN
    Gate_Open := TRUE;  // Open the gate when authorized and presence detected
    One_Hour_Timer := T#1H;  // Restart the timer
END_IF

// Your program logic continues here

END_PROGRAM
