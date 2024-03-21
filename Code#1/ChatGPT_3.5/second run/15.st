// 26.41s
// 4
FUNCTION FC1002
VAR_INPUT
    E_A: BOOL;       // Switch for turning on/off the monitoring system
    UltrasonicDetected: BOOL;  // Ultrasonic sensor detection signal
    P1: BOOL;        // Status indicating the monitoring system is switched on
END_VAR

VAR
    Timer: TON;      // Timer to measure the duration of detection
    P_HU: BOOL;      // Acoustic warning signal
    P_AL: BOOL;      // Alarm signal
    TimerDuration: TIME := T#3S;  // Duration for the alarm timer
END_VAR

BEGIN
    // Initialize the timer parameters
    Timer(IN := UltrasonicDetected AND E_A, PT := TimerDuration);

    // Output signals initialization
    P_HU := FALSE;
    P_AL := FALSE;

    // Check if the monitoring system is switched on
    IF E_A THEN
        P1 := TRUE;  // Monitoring system is switched on

        // Check if the ultrasonic sensor detects an approach
        IF UltrasonicDetected THEN
            // Start the timer when an approach is detected
            Timer(IN := TRUE);

            // If the timer reaches the specified duration, switch off the warning signal
            IF Timer.Q THEN
                P_HU := FALSE;

                // Switch on the alarm signal
                P_AL := TRUE;
            ELSE
                // If the detection is within the timer duration, switch on the warning signal
                P_HU := TRUE;

                // Switch off the alarm signal
                P_AL := FALSE;
            END_IF
        END_IF
    ELSE
        // Switch off all signals when the monitoring system is switched off
        P1 := FALSE;
        P_HU := FALSE;
        P_AL := FALSE;
    END_IF
END_FUNCTION
