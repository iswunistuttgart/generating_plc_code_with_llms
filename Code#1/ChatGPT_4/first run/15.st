// 58.63s
// 3
FUNCTION FC1002
VAR_INPUT
    SensorDetected : BOOL;  // TRUE if the ultrasonic sensor detects something
    E_A            : BOOL;  // The switch to turn the monitoring system on/off
END_VAR

VAR_OUTPUT
    P_HU           : BOOL;  // The horn for acoustic warning
    P_AL           : BOOL;  // The alarm
    P1             : BOOL;  // Indicator for monitoring system status
END_VAR

VAR
    DetectionTimer : TON;   // Timer for detection duration
END_VAR

// Turn on the monitoring system and indicate status
IF E_A THEN
    P1 := TRUE;
ELSE
    P1 := FALSE;
    P_HU := FALSE;  // Turn off horn when system is turned off
    P_AL := FALSE;  // Turn off alarm when system is turned off
END_IF

// Handling sensor detection
IF SensorDetected THEN
    IF NOT DetectionTimer.IN THEN
        DetectionTimer(IN := TRUE, PT := T#3s);  // Start timer when detection begins
    END_IF
    IF DetectionTimer.Q THEN
        P_HU := FALSE;  // Turn off horn after 3 seconds
        P_AL := TRUE;   // Turn on alarm after 3 seconds
    ELSE
        P_HU := TRUE;   // Turn on horn when detection is within 3 seconds
    END_IF
ELSE
    DetectionTimer(IN := FALSE);  // Reset timer when no detection
    P_HU := FALSE;                // Turn off horn if nothing is detected
    // Keep alarm on if it was already triggered, unless the system is turned off
END_IF
