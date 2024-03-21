// 122.22s
// 4
FUNCTION_BLOCK BURNER
VAR_INPUT
    IN : BOOL;
    STAGE2 : BOOL;
    OVER_TEMP : BOOL;
    OIL_TEMP : BOOL := TRUE;
    FLAME : BOOL;
    RST : BOOL;
    RST_TIMER : BOOL;
    PRE_HEAT_TIME : TIME := T#5S;
    PRE_VENT_TIME : TIME := T#15S;
    PRE_IGNITE_TIME : TIME := T#15S;
    POST_IGNITE_TIME : TIME := T#25S;
    STAGE2_DELAY : TIME := T#10S;
    SAFETY_TIME : TIME := T#5S;
    LOCKOUT_TIME : TIME := T#10S;
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
    last_change : TIME;
    timer1 : TON;
    timer2 : TON;
    oil_temp_last : BOOL;
END_VAR

// Reset functionality
IF RST THEN
    state := 0; // Reset state to initial
    FAIL := FALSE;
    STATUS := 0;
    MOTOR := FALSE;
    COIL1 := FALSE;
    COIL2 := FALSE;
    PRE_HEAT := FALSE;
    IGNITE := FALSE;
END_IF;

// Over temperature check
IF OVER_TEMP THEN
    FAIL := TRUE;
    STATUS := 9; // Error code for over temperature
    RETURN;
END_IF;

// Main state machine for burner control
CASE state OF
    0:
        IF IN THEN
            PRE_HEAT := TRUE;
            timer1(IN := TRUE, PT := PRE_HEAT_TIME); // Start pre-heating timer
            state := 1;
            STATUS := 111; // Startup sequence
        ELSE
            STATUS := 110; // Wait for start signal (Standby)
        END_IF;
    1:
        IF NOT OIL_TEMP THEN
            IF timer1.Q THEN
                // Pre-heat time expired without reaching oil temp
                FAIL := TRUE;
                STATUS := 1; // Error code for fuel oil warming not responding
                state := 99; // Move to error state
            END_IF;
        ELSE
            MOTOR := TRUE; // Start motor and fan
            timer2(IN := TRUE, PT := PRE_VENT_TIME + PRE_IGNITE_TIME); // Start ignition timer
            state := 2; // Move to ignition state
        END_IF;
    2:
        IF timer2.ET >= PRE_VENT_TIME THEN
            IGNITE := TRUE;
            COIL1 := TRUE; // Open oil valve
            // Wait for flame or safety timer
            IF FLAME THEN
                state := 3; // Move to running state
                STATUS := 112; // Burner runs on stage 1
            ELSIF timer2.Q THEN
                // Safety time expired without flame
                FAIL := TRUE;
                STATUS := 4; // Error code for safety time expired without flame
                state := 99; // Move to error state
            END_IF;
        END_IF;
    // Additional states for stage 2, multiple ignition, and error handling could be added here
    99:
        // Error state
        MOTOR := FALSE;
        COIL1 := FALSE;
        COIL2 := FALSE;
        PRE_HEAT := FALSE;
        IGNITE := FALSE;
        // Lockout handling, resetting, and error messaging would be managed here
END_CASE;

// Update timers
timer1(IN := (state = 1) AND NOT OIL_TEMP, PT := PRE_HEAT_TIME);
timer2(IN := (state = 2), PT := PRE_VENT_TIME + PRE_IGNITE_TIME + SAFETY_TIME);
END_FUNCTION_BLOCK
