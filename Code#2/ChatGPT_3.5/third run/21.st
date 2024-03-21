// 36.26s
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
    state : INT := 110; // Initial state: Standby
    last : TIME;
    tx : TIME;
    last_change : TIME;
    timer1 : TON;
    timer2 : TON;
    oil_temp_last : BOOL;
    cycles2 : UDINT;
END_VAR

METHOD RunBurner: BOOL
    // State Machine Logic
    CASE state OF
        110: // Standby
            IF IN AND NOT OVER_TEMP THEN
                state := 111; // Startup sequence
                last := TON_TIME();
            END_IF;
        111: // Startup sequence
            PRE_HEAT := TRUE;
            IF TON(TIME() - last, PRE_HEAT_TIME) THEN
                IF OIL_TEMP AND NOT FLAME THEN
                    last := TON_TIME();
                    state := 112; // Burner runs on stage 1
                    CYCLES := CYCLES + 1;
                    RUNTIME1 := RUNTIME1 + (TIME() - last_change);
                END_IF;
            END_IF;
        112: // Burner runs on stage 1
            MOTOR := TRUE;
            COIL1 := TRUE;
            COIL2 := FALSE;

            IF STAGE2 AND TON(TIME() - last_change, STAGE2_DELAY) THEN
                state := 113; // Burner runs at stage 2
                timer2.IN := FALSE; // Reset timer2
            END_IF;
        113: // Burner runs at stage 2
            MOTOR := TRUE;
            COIL1 := FALSE;
            COIL2 := TRUE;

            // Check for flame sensor response
            IF FLAME THEN
                timer2.IN := TRUE; // Start timer2
                IF timer2.Q THEN
                    STATUS := 5; // Flame stops in operation
                    FAIL := TRUE;
                END_IF;
            END_IF;

            // Check for multiple ignition
            IF FLAME AND MULTIPLE_IGNITION THEN
                IGNITE := TRUE;
                MULTIPLE_IGNITION := FALSE;
            END_IF;

            // Check for flame break
            IF NOT FLAME AND MULTIPLE_IGNITION THEN
                IGNITE := FALSE;
            END_IF;

            // Check for stage 2 activation
            IF STAGE2 AND NOT FLAME THEN
                state := 113; // Continue at stage 2
            END_IF;

            // Check for over temperature
            IF OVER_TEMP THEN
                STATUS := 9; // Boiler overheating contact has tripped
                FAIL := TRUE;
                state := 110; // Standby
            END_IF;

            // Check for lockout time
            IF RST_TIMER THEN
                timer1.IN := FALSE; // Reset timer1
                state := 110; // Standby
            END_IF;
    END_CASE;

    // Calculate KWH
    KWH := (REAL(CYCLES) * KW1 * TO_REAL(RUNTIME1) / 3600) + (REAL(cycles2) * KW2 * TO_REAL(RUNTIME2) / 3600);

    // Return true if the burner is active
    RETURN (state = 111 OR state = 112 OR state = 113);
END_METHOD;
END_FUNCTION_BLOCK
