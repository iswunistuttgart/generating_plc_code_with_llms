//10.7s
//2
PROGRAM GateController
VAR_INPUT
    Start_Loop: BOOL;        // Input to start the gate controller
    Gate_Open: BOOL;         // Input indicating whether the gate is open
    App_Presence: BOOL;      // Input indicating the presence of the app
    Car_Presence: BOOL;      // Input indicating the presence of the car
    Auth_String: STRING;     // Input authentication string
END_VAR

VAR_OUTPUT
    Gate_Control: BOOL;      // Output to control the gate (TRUE to open, FALSE to close)
END_VAR

VAR
    One_Hour_Timer: TON;     // One-hour timer
    Timer_Done: BOOL;        // Timer done flag
    Auth_Matched: BOOL;      // Authentication string match flag
    My_Defined_Str: STRING := "your_defined_string"; // Replace with your actual authentication string
END_VAR

METHOD OpenGate
    Gate_Control := TRUE;
END_METHOD

METHOD CloseGate
    Gate_Control := FALSE;
END_METHOD

IF Start_Loop THEN
    One_Hour_Timer(IN := FALSE);
    Timer_Done := FALSE;
    Auth_Matched := FALSE;
ELSE
    One_Hour_Timer(IN := TRUE, PT := T#1H);  // Start the 1-hour timer when Start_Loop is FALSE
    IF One_Hour_Timer.Q THEN
        Timer_Done := TRUE;  // Timer has timed out
        IF Gate_Open THEN
            CloseGate();  // Close the gate if it's still open
        END_IF
    END_IF
    IF (App_Presence OR Car_Presence) AND Auth_String = My_Defined_Str THEN
        Auth_Matched := TRUE;  // Authentication string matches, and either the app or car is present
        OpenGate();  // Open the gate
    END_IF
END_IF

END_PROGRAM
