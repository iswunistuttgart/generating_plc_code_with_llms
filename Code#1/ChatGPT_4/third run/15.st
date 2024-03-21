// 49.09s
// 3
FUNCTION FC1002 : VOID
VAR_INPUT
    Detected: BOOL;    // Detection by ultrasonic sensor
    SystemOn: BOOL;    // System on/off switch (E_A)
END_VAR

VAR_OUTPUT
    P_HU: BOOL;        // Horn for acoustic warning
    P_AL: BOOL;        // Alarm signal
    P1: BOOL;          // System on indicator
END_VAR

VAR
    DetectionTimer: TON; // Timer for detection duration
END_VAR

BEGIN
    IF SystemOn THEN
        P1 := TRUE; // Indicate system is on

        IF Detected THEN
            IF NOT DetectionTimer.IN THEN
                DetectionTimer(IN := TRUE, PT := T#3s); // Start timer when object is detected
            END_IF;

            IF NOT DetectionTimer.Q THEN
                P_HU := TRUE; // Activate warning horn if object detected
            ELSE
                P_HU := FALSE;
                P_AL := TRUE; // Activate alarm if object detected for more than 3 seconds
            END_IF;
        ELSE
            DetectionTimer(IN := FALSE); // Reset timer if no object is detected
            P_HU := FALSE;
        END_IF;
    ELSE
        P1 := FALSE; // Indicate system is off
        DetectionTimer(IN := FALSE); // Reset timer
        P_HU := FALSE;
        P_AL := FALSE; // Reset alarm
    END_IF;
END_FUNCTION
