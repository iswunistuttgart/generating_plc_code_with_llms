//44.26s
//2
PROGRAM GateController
VAR
    Start_Loop: BOOL; // Control variable to start the timer loop
    One_Hour_Timer: TON; // Timer that counts up to 1 hour
    Gate_Open: BOOL; // Indicates if the gate is open
    Sense_App: BOOL; // Senses the app signal
    Sense_Car: BOOL; // Senses the car signal
    Auth_String: STRING; // Received authorization string
    CONST my_defined_str: STRING := 'YourAuthString'; // Replace with your actual auth string
END_VAR

// Start the one hour timer when Start_Loop is FALSE
IF NOT Start_Loop THEN
    One_Hour_Timer(IN := TRUE, PT := T#1h); // Set the preset time to 1 hour
ELSE
    One_Hour_Timer(IN := FALSE, PT := T#1h);
END_IF

// Check for timeout to close the gate
IF One_Hour_Timer.Q AND Gate_Open THEN
    Gate_Open := FALSE; // Close the gate
END_IF

// Check for app or car sense and correct authorization string
IF (Sense_App OR Sense_Car) AND (Auth_String = my_defined_str) THEN
    Gate_Open := TRUE; // Open the gate
END_IF

// Reset the timer if the gate is manually closed
IF NOT Gate_Open THEN
    One_Hour_Timer(IN := FALSE); // Reset the timer
    Start_Loop := TRUE; // Ready to start the loop again
END_IF

END_PROGRAM
