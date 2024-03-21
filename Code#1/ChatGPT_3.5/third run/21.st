// 49.33s
// 2
FUNCTION_BLOCK BURNER
VAR_INPUT
    IN: BOOL;              // Control input to start the burner
    OVER_TEMP: BOOL;       // Boiler thermostat protection input
    OIL_TEMP: BOOL;        // Signal indicating oil temperature
    MULTIPLE_IGNITION: BOOL;  // Allow multiple ignitions after flame failure
    STAGE2: BOOL;          // Activate second stage
    RST: BOOL;             // Reset input to restart after lockout time
END_VAR

VAR_OUTPUT
    PRE_HEAT: BOOL;        // Start fuel oil warming
    MOTOR: BOOL;           // Motor control output
    FAN: BOOL;             // Fan control output
    IGNITION: BOOL;        // Ignition control output
    OIL_VALVE: BOOL;       // Oil valve control output
    STAGE2_ACTIVATED: BOOL; // Second stage activation output
    FAIL: BOOL;            // Failure indication output
    STATUS: INT;           // Status output indicating the current state
END_VAR

VAR
    START_TIME: TIME;            // Start time of the sequence
    STAGE1_TIME: TIME := T#10s;  // Time for the first stage
    STAGE2_DELAY: TIME := T#5s;   // Delay for second stage activation
    SAFETY_TIME: TIME := T#15s;   // Safety time for flame detection
    LOCKOUT_TIME: TIME := T#300s; // Lockout time after a fault
    PRE_HEAT_TIME: TIME := T#30s; // Fuel oil warming time
    PRE_VENTILATION_TIME: TIME := T#10s; // Time for pre-ventilation
    PPR_IGNITION_TIME: TIME := T#5s;    // Time before opening the oil valve for ignition
    POST_IGNITION_TIME: TIME := T#5s;   // Time after ignition before considering the stage completed

    STAGE1_TIMER: TON := (PT := STAGE1_TIME);
    SAFETY_TIMER: TON := (PT := SAFETY_TIME);
    LOCKOUT_TIMER: TON := (PT := LOCKOUT_TIME);
    PRE_HEAT_TIMER: TON := (PT := PRE_HEAT_TIME);
    PRE_VENTILATION_TIMER: TON := (PT := PRE_VENTILATION_TIME);
    PPR_IGNITION_TIMER: TON := (PT := PPR_IGNITION_TIME);
    POST_IGNITION_TIMER: TON := (PT := POST_IGNITION_TIME);
    STAGE2_DELAY_TIMER: TON := (PT := STAGE2_DELAY);
END_VAR

METHOD BurnerControl
    // Status initialization
    STATUS := 110; // Wait for Start signal (Standby)
    FAIL := FALSE;

    IF RST AND LOCKOUT_TIMER.Q THEN
        // Reset after the lockout time has passed
        LOCKOUT_TIMER(IN := FALSE);
    END_IF

    // Burner operation control
    CASE STATUS OF
        110: // Wait for Start signal (Standby)
            IF IN AND NOT OVER_TEMP THEN
                STATUS := 111; // Startup sequence is executed
                START_TIME := TIME();
                PRE_HEAT := TRUE;
            END_IF
        111: // Startup sequence is executed
            IF PRE_HEAT_TIMER.Q THEN
                PRE_HEAT := FALSE;
                MOTOR := TRUE; // Start the motor
                FAN := TRUE;   // Start the fan
                STAGE1_TIMER(IN := TRUE);
            END_IF

            IF STAGE1_TIMER.Q THEN
                // First stage completed
                IGNITION := TRUE; // Start ignition
                PPR_IGNITION_TIMER(IN := TRUE);
                STATUS := 112; // Burner runs on stage 1
            END_IF
        112: // Burner runs on stage 1
            IF MULTIPLE_IGNITION AND PPR_IGNITION_TIMER.Q THEN
                // Ignition failed, start another ignition attempt
                IGNITION := TRUE;
                PPR_IGNITION_TIMER(IN := TRUE);
            END_IF

            IF PPR_IGNITION_TIMER.Q THEN
                // Ignition completed, open the oil valve
                IGNITION := FALSE;
                OIL_VALVE := TRUE;
                POST_IGNITION_TIMER(IN := TRUE);
            END_IF

            IF POST_IGNITION_TIMER.Q THEN
                // First stage completed
                STATUS := 113; // Burner runs on stage 2
                STAGE2_ACTIVATED := TRUE;
                STAGE2_DELAY_TIMER(IN := TRUE);
            END_IF
        113: // Burner runs on stage 2
            IF STAGE2_DELAY_TIMER.Q THEN
                // Second stage activated
                STAGE2_ACTIVATED := STAGE2;
            END_IF

            // Check for flame failure
            IF SAFETY_TIMER.Q AND (IGNITION OR OIL_VALVE) THEN
                FAIL := TRUE; // Flame failure
                STATUS := 5;   // Fame stops in operation
            END_IF
    END_CASE

    // Check for lockout conditions
    IF OVER_TEMP THEN
        STATUS := 9;  // Boiler overheating contact has tripped
    END_IF

    // Update status and initiate lockout if needed
    IF STATUS <> 9 AND (FAIL OR (RST AND NOT LOCKOUT_TIMER.Q)) THEN
        STATUS := 110; // Wait for Start signal (Standby)
        LOCKOUT_TIMER(IN := TRUE); // Initiate lockout
    END_IF
END_METHOD

END_FUNCTION_BLOCK
