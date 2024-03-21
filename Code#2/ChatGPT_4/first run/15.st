// 55.65s
// 4
FUNCTION FC1002 : BOOL
VAR_INPUT
    E_A : BOOL; // Switch to turn the monitoring system on and off
    SENSOR : BOOL; // Ultrasonic sensor detection input
    ZEITW : TIME; // Time constant (3 seconds)
END_VAR
VAR_IN_OUT
    ZEIT : TON; // Timer for measuring detection duration
    P_HU : BOOL; // Horn for acoustic warning signal
    P_AL : BOOL; // Alarm signal
END_VAR

// Reset the outputs and timer if the system is turned off
IF NOT E_A THEN
    P_HU := FALSE;
    P_AL := FALSE;
    ZEIT(IN := FALSE); // Reset timer
    FC1002 := FALSE;
    RETURN;
END_IF

// Turn on the system
FC1002 := TRUE;

// Sensor detection logic
IF SENSOR THEN
    ZEIT(IN := TRUE, PT := ZEITW); // Start or continue the timer
    IF ZEIT.Q THEN
        P_HU := FALSE; // Turn off horn after 3 seconds
        P_AL := TRUE;  // Turn on alarm
    ELSE
        P_HU := TRUE; // Horn on while sensor detects within 3 seconds
    END_IF
ELSE
    ZEIT(IN := FALSE); // Reset timer if no detection
    P_HU := FALSE; // Turn off horn if no detection
    P_AL := FALSE; // Turn off alarm if no detection
END_IF

END_FUNCTION
