// 11.59s
// 2
FUNCTION FC1002 : BOOL
VAR_INPUT
	E_A, SENSOR: BOOL;
	ZEITW: TIME;
END_VAR

VAR_IN_OUT
	ZEIT: TON;
	P_HU, P_AL: BOOL;
END_VAR

// Check if the monitoring system is switched on
IF E_A THEN
    // Check if the ultrasonic sensor detects an approach
    IF SENSOR THEN
        // Start the timer if it's not running
        IF NOT ZEIT.IN THEN
            ZEIT(IN := TRUE, PT := ZEITW);
        ELSE
            // Check if the timer has reached the set time
            IF ZEIT.Q THEN
                // Turn off the warning signal and switch on the alarm
                P_HU := FALSE;
                P_AL := TRUE;
            END_IF;
        END_IF;
    ELSE
        // Reset the timer if no approach is detected
        ZEIT(IN := FALSE);
    END_IF;

    // Check if the timer is not running
    IF NOT ZEIT.IN THEN
        // Check if the alarm is active and turn it off
        IF P_AL THEN
            P_AL := FALSE;
        END_IF;

        // Turn on the warning signal if an approach is detected
        P_HU := SENSOR;
    END_IF;
ELSE
    // Turn off both the warning signal and the alarm if the monitoring system is switched off
    P_HU := FALSE;
    P_AL := FALSE;
    // Reset the timer
    ZEIT(IN := FALSE);
END_IF;

// Return the output state
RETURN E_A;

END_FUNCTION
