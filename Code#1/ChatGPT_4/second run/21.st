// 119.91s
// 3
FUNCTION_BLOCK BURNER
VAR_INPUT
    IN : BOOL;                // Start signal
    OVER_TEMP : BOOL;         // Boiler over-temperature signal
    OIL_TEMP : BOOL;          // Oil temperature readiness signal
    STAGE2 : BOOL;            // Signal to start stage 2
    RST : BOOL;               // Reset signal
END_VAR

VAR_OUTPUT
    PRE_HEAT : BOOL;          // Pre-heating signal
    MOTOR : BOOL;             // Motor operation signal
    IGNITION : BOOL;          // Ignition signal
    OIL_VALVE : BOOL;         // Oil valve open signal
    FAIL : BOOL;              // Failure signal
    STATUS : INT;             // Status code output
END_VAR

VAR
    TIMER : TON;              // Timer for managing delays
    currentStage : INT := 0;  // Current operation stage
    lockoutTimer : TON;       // Timer for managing lockout period
END_VAR

// Constants for timing (to be adjusted as per requirements)
VAR CONSTANT
    PRE_HEAT_TIME : TIME := T#30s;
    PRE_VENTILATION_TIME : TIME := T#15s;
    PRE_IGNITE_TIME : TIME := T#5s;
    SAFETY_TIME : TIME := T#10s;
    POST_IGNITE_TIME : TIME := T#5s;
    STAGE2_DELAY : TIME := T#60s;
    LOCKOUT_TIME : TIME := T#300s;
    MULTIPLE_IGNITION : BOOL := TRUE;  // Can be set based on requirements
END_VAR

// State machine logic
IF OVER_TEMP THEN
    // Immediate stop and report error 9
    STATUS := 9;
    FAIL := TRUE;
    ResetOutputs();
ELSIF RST AND NOT lockoutTimer.Q THEN
    // Resetting the burner
    FAIL := FALSE;
    STATUS := 110; // Standby
    currentStage := 0;
    ResetOutputs();
ELSIF IN THEN
    CASE currentStage OF
    0:  // Start sequence
        PRE_HEAT := TRUE;
        TIMER(IN := TRUE, PT := PRE_HEAT_TIME);
        IF OIL_TEMP THEN
            currentStage := 1;
            PRE_HEAT := FALSE;
            MOTOR := TRUE;
        ELSIF TIMER.Q THEN
            // Pre-heat failure
            FAIL := TRUE;
            STATUS := 1;
            currentStage := -1;  // Move to error state
        END_IF;
    1:  // Motor and ventilation
        TIMER(IN := TRUE, PT := PRE_VENTILATION_TIME);
        IF TIMER.Q THEN
            currentStage := 2;
            MOTOR := FALSE;  // Assuming motor should stop before ignition, adjust as needed
            IGNITION := TRUE;
        END_IF;
    2:  // Ignition and oil valve
        TIMER(IN := TRUE, PT := PRE_IGNITE_TIME);
        IF TIMER.Q THEN
            OIL_VALVE := TRUE;
            TIMER(IN := TRUE, PT := SAFETY_TIME);  // Start safety timer
            currentStage := 3;
        END_IF;
    3:  // Safety check
        IF NOT TIMER.Q THEN
            // Assume flame detected, proceed
            STATUS := 112;  // Burner running on stage 1
            currentStage := 4;
        ELSE
            // Safety time passed without flame
            FAIL := TRUE;
            STATUS := 4;
            currentStage := -1;  // Move to error state
        END_IF;
    4:  // Stage 2 check
        IF STAGE2 THEN
            TIMER(IN := TRUE, PT := STAGE2_DELAY);
            IF TIMER.Q THEN
                STATUS := 113;  // Burner running at stage 2
                // Implement stage 2 functionality as required
            END_IF;
        END_IF;
    -1: // Error state
        ResetOutputs();
        lockoutTimer(IN := TRUE, PT := LOCKOUT_TIME);  // Start lockout timer
        IF lockoutTimer.Q THEN
            // Lockout period finished, ready for reset
            currentStage := 0;
            FAIL := FALSE;
            STATUS := 110; // Back to standby after reset
        END_IF;
    END_CASE;
END_IF;

// Helper procedure to reset outputs
PROCEDURE ResetOutputs();
BEGIN
    PRE_HEAT := FALSE;
    MOTOR := FALSE;
    IGNITION := FALSE;
    OIL_VALVE := FALSE;
    TIMER(IN := FALSE, PT := T#0s);  // Reset timer
END_PROCEDURE

END_FUNCTION_BLOCK
