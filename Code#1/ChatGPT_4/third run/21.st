// 117.54s
// 2
FUNCTION_BLOCK BURNER
VAR_INPUT
    IN: BOOL;                    // Start control input
    OVER_TEMP: BOOL;             // Boiler over temperature protection
    OIL_TEMP: BOOL;              // Oil temperature readiness
    STAGE2: BOOL;                // Control input for activating stage 2
    RST: BOOL;                   // Reset input for clearing faults and lockout
END_VAR

VAR_OUTPUT
    PRE_HEAT: BOOL;              // Fuel oil warming activation output
    FAIL: BOOL;                  // Failure indication output
    STATUS: INT;                 // Status and error code output
END_VAR

VAR
    Timer: TON;                  // Timer for managing time delays
    LockoutTimer: TON;           // Lockout timer
    CurrentStage: INT := 110;    // Current operational stage
    Lockout: BOOL := FALSE;      // Lockout flag
END_VAR

// Constants for timing and stages (these should be adjusted as per requirements)
VAR CONSTANT
    PRE_HEAT_TIME: TIME := T#30s;
    SAFETY_TIME: TIME := T#60s;
    STAGE2_DELAY: TIME := T#120s;
    LOCKOUT_TIME: TIME := T#300s;
    PRE_VENTILATION_TIME: TIME := T#15s;
    PRE_IGNITE_TIME: TIME := T#5s;
    POST_IGNITE_TIME: TIME := T#10s;
END_VAR

// Implementation of the burner logic
BEGIN
    // Handle lockout period after faults
    IF Lockout THEN
        IF LockoutTimer(IN := TRUE, PT := LOCKOUT_TIME) THEN
            Lockout := FALSE;
            LockoutTimer(IN := FALSE); // Stop lockout timer
        END_IF;
        EXIT; // Exit the execution to ensure no operation during lockout
    END_IF;

    IF RST AND NOT LockoutTimer.Q THEN
        // Reset logic to clear faults and prepare for a new start
        FAIL := FALSE;
        STATUS := 110; // Wait for Start signal
        Lockout := FALSE;
        PRE_HEAT := FALSE;
        CurrentStage := 110;
    END_IF;

    IF OVER_TEMP THEN
        // Handle over temperature error
        FAIL := TRUE;
        STATUS := 9; // Error code for over temperature
        Lockout := TRUE;
        LockoutTimer(IN := TRUE, PT := LOCKOUT_TIME); // Start lockout timer
        EXIT; // Stop all operations immediately
    END_IF;

    IF IN AND NOT Lockout THEN
        // Start sequence and operational logic
        CASE CurrentStage OF
            110: // Standby, waiting for start signal
                IF IN THEN
                    PRE_HEAT := TRUE;
                    Timer(IN := TRUE, PT := PRE_HEAT_TIME);
                    CurrentStage := 111; // Startup sequence
                END_IF;
            111: // Startup sequence, waiting for OIL_TEMP signal
                IF OIL_TEMP THEN
                    Timer(IN := FALSE); // Stop the pre-heat timer
                    // Transition to next stage would be here, implementing further logic for fan, ignition, etc.
                    // This is a simplified representation
                    CurrentStage := 112; // Burner runs on stage 1
                ELSIF Timer.Q THEN
                    // Pre-heat time exceeded without reaching OIL_TEMP
                    FAIL := TRUE;
                    STATUS := 1; // Error code for pre-heat failure
                    Lockout := TRUE;
                    LockoutTimer(IN := TRUE, PT := LOCKOUT_TIME); // Start lockout timer
                END_IF;
            // Additional stages for fan operation, ignition, stage 2, etc., should be implemented here
        END_CASE;
    END_IF;
END_FUNCTION_BLOCK
