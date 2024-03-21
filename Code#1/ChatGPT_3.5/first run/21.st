// 46.74s
// 2
FUNCTION_BLOCK BURNER
VAR_INPUT
    IN: BOOL;                  // Control input
    OVER_TEMP: BOOL;           // Boiler thermostat protection
    OIL_TEMP: BOOL;            // Signal indicating oil temperature reached
    MULTIPLE_IGNITION: BOOL;   // Enable multiple ignition after flame break
    STAGE2: BOOL;              // Activate second stage
END_VAR_INPUT

VAR_OUTPUT
    PRE_HEAT: BOOL;            // Fuel oil warming
    MOTOR: BOOL;               // Motor status
    FAN: BOOL;                 // Fan status
    IGNITION: BOOL;            // Ignition status
    OIL_VALVE: BOOL;           // Oil valve status
    STATUS: INT;               // Module status
    FAIL: BOOL;                // Failure indication
END_VAR_OUTPUT

VAR
    startTime: TIME;           // Start time for various stages
    locked: BOOL;              // Module lock status
END_VAR

METHOD StartBurner : BOOL
VAR
    elapsedTime: TIME;         // Elapsed time for various stages
BEGIN
    // Check if the module is locked
    IF locked THEN
        STATUS := 99;  // Module is locked
        RETURN FALSE;
    END_IF

    // Reset failure indication
    FAIL := FALSE;

    // Start sequence
    IF IN AND NOT OVER_TEMP THEN
        PRE_HEAT := TRUE;  // Fuel oil warming
        startTime := T;    // Record start time

        // Wait for OIL_TEMP signal within PRE_HEAT_TIME
        WHILE (T - startTime < PRE_HEAT_TIME) AND NOT OIL_TEMP DO
            // Check if OVER_TEMP signal received during waiting
            IF OVER_TEMP THEN
                STATUS := 9;  // Boiler overheating error
                RETURN FALSE;
            END_IF
        END_WHILE

        // Check if OIL_TEMP signal received within PRE_HEAT_TIME
        IF OIL_TEMP THEN
            MOTOR := TRUE;  // Start motor
            FAN := TRUE;    // Start fan

            // Wait for PRE_VENTILATION_TIME before ignition
            WHILE (T - startTime < PRE_VENTILATION_TIME) DO
                // Check if OVER_TEMP signal received during waiting
                IF OVER_TEMP THEN
                    STATUS := 9;  // Boiler overheating error
                    RETURN FALSE;
                END_IF
            END_WHILE

            IGNITION := TRUE;  // Turn on ignition

            // Wait for PPR_IGNITION_TIME before opening oil valve
            WHILE (T - startTime < PPR_IGNITION_TIME) DO
                // Check if OVER_TEMP signal received during waiting
                IF OVER_TEMP THEN
                    STATUS := 9;  // Boiler overheating error
                    RETURN FALSE;
                END_IF
            END_WHILE

            OIL_VALVE := TRUE;  // Open oil valve

            // Wait for POST_IGNITION_TIME after ignition
            WHILE (T - startTime < POST_IGNITION_TIME) DO
                // Check if OVER_TEMP signal received during waiting
                IF OVER_TEMP THEN
                    STATUS := 9;  // Boiler overheating error
                    RETURN FALSE;
                END_IF
            END_WHILE

            // Check if flame sensor is active during SAFETY_TIME
            IF FLAME_SENSOR_ACTIVE(DURATION := SAFETY_TIME) THEN
                STATUS := 4;  // Safety time error
                RETURN FALSE;
            END_IF

            // Successful operation in stage 1
            STATUS := 112;  // Burner runs on stage 1

            // If MULTIPLE_IGNITION is enabled and flame breaks off, restart ignition
            IF MULTIPLE_IGNITION AND FLAME_SENSOR_ACTIVE(DURATION := MULTIPLE_IGNITION_TIME) THEN
                IGNITION := TRUE;  // Restart ignition
            END_IF

            // Check if second stage is activated
            IF STAGE2 THEN
                // Wait for STAGE2_DELAY before activating second stage
                WHILE (T - startTime < STAGE2_DELAY) DO
                    // Check if OVER_TEMP signal received during waiting
                    IF OVER_TEMP THEN
                        STATUS := 9;  // Boiler overheating error
                        RETURN FALSE;
                    END_IF
                END_WHILE

                // Activate second stage
                STATUS := 113;  // Burner runs at stage 2
            END_IF

            // Burner operation completed successfully
            RETURN TRUE;
        ELSE
            // OIL_TEMP signal not received within PRE_HEAT_TIME
            STATUS := 1;  // Fuel oil warming not responded error
            FAIL := TRUE;
            RETURN FALSE;
        END_IF
    ELSE
        // IN or OVER_TEMP condition not met
        STATUS := 110;  // Wait for Start signal (Standby)
        RETURN FALSE;
    END_IF
END_METHOD

METHOD FLAME_SENSOR_ACTIVE : BOOL
VAR_INPUT
    DURATION: TIME;  // Duration to check flame sensor activity
END_VAR_INPUT

VAR
    startTime: TIME;  // Start time for flame sensor check
BEGIN
    startTime := T;

    WHILE (T - startTime < DURATION) DO
        // Check if flame sensor is active
        IF FLAME_SENSOR THEN
            STATUS := 2;  // Flame sensor active error
            FAIL := TRUE;
            RETURN TRUE;
        END_IF
    END_WHILE

    // Flame sensor not active within specified duration
    RETURN FALSE;
END_METHOD

METHOD Lockout : BOOL
VAR
    lockoutStartTime: TIME;  // Start time for lockout
BEGIN
    // Set the module to locked state
    locked := TRUE;

    // Start lockout timer
    lockoutStartTime := T;

    // Wait for LOCKOUT_TIME
    WHILE (T - lockoutStartTime < LOCKOUT_TIME) AND NOT RST DO
        // Check if OVER_TEMP signal received during waiting
        IF OVER_TEMP THEN
            STATUS := 9;  // Boiler overheating error
            FAIL := TRUE;
            RETURN FALSE;
        END_IF
    END_WHILE

    // Reset the module lock
    locked := FALSE;

    // Module is ready for operation again
    STATUS := 110;  // Wait for Start signal (Standby)

    // Return TRUE if RST signal received after LOCKOUT_TIME
    RETURN RST;
END_METHOD

END_FUNCTION_BLOCK
