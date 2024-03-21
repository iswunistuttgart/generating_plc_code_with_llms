//35.75s
//4
PROGRAM GateController
VAR
    Start_Loop : BOOL; // Control variable to start the loop
    One_Hour_Timer : TON; // Timer that times out after 1 hour
    Gate_Is_Open : BOOL; // Indicates if the gate is open
    Sense_Car_App : BOOL; // Input that senses the car or the app
    Auth_String : STRING; // Authentication string provided by the car or app
    my_defined_str : STRING := 'YourAuthString'; // Predefined correct authentication string
    Timer_Done : BOOL; // Flag to indicate that the timer is done
END_VAR

// Check if the loop should start
IF NOT Start_Loop THEN
    IF NOT One_Hour_Timer.Q THEN // If the timer is not already done
        One_Hour_Timer(IN := TRUE, PT := T#1H); // Start or continue timing
    ELSE
        Timer_Done := TRUE; // Set the flag when the timer is done
    END_IF
ELSE
    One_Hour_Timer(IN := FALSE, PT := T#1H); // Reset the timer if Start_Loop is TRUE
    Timer_Done := FALSE; // Reset the flag
END_IF

// Timer logic to close the gate if it's still open after 1 hour
IF Timer_Done AND Gate_Is_Open THEN
    Gate_Is_Open := FALSE; // Close the gate
END_IF

// Logic to open the gate if the car or app is sensed and the authentication string matches
IF Sense_Car_App AND (Auth_String = my_defined_str) THEN
    Gate_Is_Open := TRUE; // Open the gate
END_IF

END_PROGRAM
