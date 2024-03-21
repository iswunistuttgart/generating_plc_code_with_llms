// 53.29s
// 4
FUNCTION FC1002 : BOOL
VAR_INPUT
    E_A : BOOL;      // Switch to turn on/off the monitoring system
    SENSOR : BOOL;   // Ultrasonic sensor input
    ZEITW : TIME;    // Time duration to switch from warning to alarm (e.g., T#3s for 3 seconds)
END_VAR
VAR_IN_OUT
    ZEIT : TON;      // Timer for tracking the duration of sensor perception
    P_HU, P_AL : BOOL; // Horn for warning and alarm outputs
END_VAR

IF E_A THEN
    // Monitoring system is turned on
    IF SENSOR THEN
        // Sensor detects something
        ZEIT(IN := TRUE, PT := ZEITW); // Start or continue the timer
        IF ZEIT.Q THEN
            // If perception lasts longer than ZEITW
            P_HU := FALSE; // Turn off horn
            P_AL := TRUE;  // Turn on alarm
        ELSE
            P_HU := TRUE;  // Turn on horn
        END_IF;
    ELSE
        // No detection by sensor
        ZEIT(IN := FALSE); // Stop the timer
        P_HU := FALSE;     // Turn off horn
    END_IF;
ELSE
    // Monitoring system is turned off
    ZEIT(IN := FALSE); // Stop the timer
    P_HU := FALSE;     // Turn off horn
    P_AL := FALSE;     // Turn off alarm
END_IF;

FC1002 := E_A; // Return the status of the monitoring system
END_FUNCTION
