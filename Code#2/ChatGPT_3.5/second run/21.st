// 47.04s
// weiter generieren
// 2
FUNCTION_BLOCK BURNER
VAR_INPUT
    IN : BOOL;
    STAGE2 : BOOL;
    OVER_TEMP : BOOL;
    OIL_TEMP : BOOL := TRUE;
    FLAME : BOOL;
    RST : BOOL;
    RST_TIMER : BOOL;
    PRE_HEAT_TIME : TIME := t#5s;
    PRE_VENT_TIME : TIME := t#15s;
    PRE_IGNITE_TIME : TIME := t#15s;
    POST_IGNITE_TIME : TIME := t#25s;
    STAGE2_DELAY : TIME := t#10s;
    SAFETY_TIME : TIME := t#5s;
    LOCKOUT_TIME : TIME := t#10s;
    MULTIPLE_IGNITION : BOOL := TRUE;
    KW1 : REAL;
    KW2 : REAL;
END_VAR
VAR_OUTPUT
    MOTOR : BOOL;
    COIL1 : BOOL;
    COIL2 : BOOL;
    PRE_HEAT : BOOL;
    IGNITE : BOOL;
    FAIL : BOOL;
    KWH : REAL;
    STATUS : BYTE;
END_VAR
VAR_IN_OUT
    RUNTIME1 : UDINT;
    RUNTIME2 : UDINT;
    CYCLES : UDINT;
END_VAR
VAR
    state : INT;
    last : TIME;
    tx : TIME;
    last_change : TIME;
    timer1 : TON;
    timer2 : TON;
    oil_temp_last : BOOL;
    cycles2 : UDINT;
END_VAR

METHOD BurnerControl : BOOL
    tx := Tcyclic - last;
    last := Tcyclic;

    // Reset error flags
    FAIL := FALSE;

    // State machine for burner control
    CASE state OF
        110:
            // Standby - Wait for start signal
            IF IN THEN
                PRE_HEAT := TRUE;
                state := 111;  // Transition to startup sequence
            END_IF;
        111:
            // Startup Sequence
            IF (NOT OVER_TEMP) AND (NOT PRE_HEAT) THEN
                // Continue with startup sequence
                IF NOT OIL_TEMP THEN
                    IF timer1(IN := TRUE, PT := PRE_HEAT_TIME) THEN
                        // Fuel oil warming has not responded in time
                        STATUS := 1;
                        FAIL := TRUE;
                        state := 110;  // Return to standby
                    END_IF;
                ELSE
                    // Fuel oil warming responded, move to next step
                    MOTOR := TRUE;
                    COIL1 := TRUE;
                    timer1(IN := TRUE, PT := PRE_VENT_TIME);
                    state := 112;
                END_IF;
            END_IF;
        112:
            // Burner runs on stage 1
            IF timer1.Q THEN
                IGNITE := TRUE;
                COIL1 := FALSE;
                timer2(IN := TRUE, PT := PRE_IGNITE_TIME);
                state := 113;
            END_IF;
        113:
            // Burner runs on stage 2
            IF (STAGE2 AND timer2.Q) THEN
                COIL2 := TRUE;
            END_IF;
    END_CASE;

    // Check for errors during startup sequence
    IF (state = 112) AND FLAME THEN
        // Flame sensor is active during aeration
        STATUS := 2;
        FAIL := TRUE;
        state := 110;  // Return to standby
    END_IF;

    // Check for errors during burner operation
    IF (state = 113) AND (NOT FLAME) THEN
        IF timer2.Q THEN
            // No flame after specified time
            STATUS := 4;
            FAIL := TRUE;
            state := 110;  // Return to standby
        END_IF;

        // Check for multiple ignitions
        IF MULTIPLE_IGNITION AND FLAME AND (timer2.ET > 0) THEN
            IGNITE := TRUE;
            COIL2 := FALSE;
            cycles2 := cycles2 + 1;
            state := 113;
        END_IF;
    END_IF;

    // Boiler overheating protection
    IF OVER_TEMP THEN
        STATUS := 9;
        FAIL := TRUE;
        state := 110;  // Return to standby
    END_IF;

    // Lockout timer
    IF FAIL THEN
        IF NOT RST_TIMER THEN
            IF timer1.Q OR timer2.Q THEN
                timer1(IN := FALSE);
                timer2(IN := FALSE);
                timer1(IN := FALSE, PT := LOCKOUT_TIME);
                state := 110;  // Return to standby
            END_IF;
        END_IF;
    END_IF;

    // Update runtime and cycles
    IF state = 113 THEN
        RUNTIME1 := RUNTIME1 + tx;
    END_IF;

    // Update outputs
    KWH := (REAL)(cycles2 + (state = 113)) * KW2 + (REAL)CYCLES * KW1;
    CYCLES := cycles2 + (state = 113);

    RETURN state = 113;  // Return TRUE when the burner is running
END_METHOD;

METHOD BurnerStatus : VOID
    // Output the current status
    CASE state OF
        110: STATUS := 110;  // Standby
        111: STATUS := 111;  // Startup sequence is executed
        112: STATUS := 112;  // Burner runs on stage 1
        113: STATUS := 113;  // Burner runs on stage 2
    END_CASE;
END_METHOD;
END_FUNCTION_BLOCK
