// 8.77s
// 2
FUNCTION FC1002 :BOOL
VAR_INPUT
    E_A, SENSOR: BOOL;
    ZEITW: TIME;
END_VAR
VAR_IN_OUT
    ZEIT:TON;
    P_HU, P_AL: BOOL;
END_VAR
    // Check if the monitoring system is switched on
    IF E_A THEN
        // Reset the timer if the sensor reports an approach
        IF SENSOR THEN
            ZEIT(IN := FALSE);
        ELSE
            // Start the timer if the sensor doesn't report an approach
            ZEIT(IN := TRUE, PT := ZEITW);
        END_IF;

        // Check if the timer has reached the specified time
        IF ZEIT.Q THEN
            // Switch off the warning signal and turn on the alarm
            P_HU := FALSE;
            P_AL := TRUE;
        ELSE
            // Switch on the warning signal
            P_HU := SENSOR;
            // Turn off the alarm
            P_AL := FALSE;
        END_IF;
    ELSE
        // Switch off the monitoring system, warning signal, and alarm
        ZEIT(IN := FALSE);
        P_HU := FALSE;
        P_AL := FALSE;
    END_IF;

    // Return the switched on status of the monitoring system
    RETURN E_A;
END_FUNCTION
