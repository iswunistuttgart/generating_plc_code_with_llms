// 34.7s
// 2
FUNCTION FC1002 : BOOL
VAR_INPUT
    E_A: BOOL;    // Switch for turning on/off the monitoring system
    Approach: BOOL;  // Signal from the ultrasonic sensor indicating an approach
END_VAR

VAR_OUTPUT
    P_HU: BOOL;  // Output for the acoustic warning signal
    P_AL: BOOL;  // Output for the alarm signal
    P1: BOOL;    // Output indicating the switched-on status
END_VAR

VAR
    Timer: TON := (PT := T#3s);  // Timer for tracking the duration of the approach
END_VAR

METHOD UltrasonicMonitoring
    IF E_A THEN
        P1 := TRUE;  // Monitoring system is switched on

        IF Approach THEN
            P_HU := TRUE;  // Acoustic warning signal is activated

            IF Timer(IN := TRUE).Q THEN
                // Approach duration exceeds 3 seconds, switch off warning and activate alarm
                P_HU := FALSE;
                P_AL := TRUE;
            END_IF
        ELSE
            // No approach, reset the timer and signals
            Timer(IN := FALSE);
            P_HU := FALSE;
            P_AL := FALSE;
        END_IF
    ELSE
        // Monitoring system is switched off, reset all signals
        P1 := FALSE;
        P_HU := FALSE;
        P_AL := FALSE;
        Timer(IN := FALSE);
    END_IF
END_METHOD

END_FUNCTION
