// 47.97s
// weiter generieren
// 2
FUNCTION_BLOCK BURNER
VAR_INPUT
    IN: BOOL;
    STAGE2: BOOL;
    OVER_TEMP: BOOL;
    OIL_TEMP: BOOL := TRUE;
    FLAME: BOOL;
    RST: BOOL;
    RST_TIMER: BOOL;
    PRE_HEAT_TIME: TIME := t#5s;
    PRE_VENT_TIME: TIME := t#15s;
    PRE_IGNITE_TIME: TIME := t#15s;
    POST_IGNITE_TIME: TIME := t#25s;
    STAGE2_DELAY: TIME := t#10s;
    SAFETY_TIME: TIME := t#5s;
    LOCKOUT_TIME: TIME := t#10s;
    MULTIPLE_IGNITION: BOOL := TRUE;
    KW1: REAL;
    KW2: REAL;
END_VAR
VAR_OUTPUT
    MOTOR: BOOL;
    COIL1: BOOL;
    COIL2: BOOL;
    PRE_HEAT: BOOL;
    IGNITE: BOOL;
    FAIL: BOOL;
    KWH: REAL;
    STATUS: BYTE;
END_VAR
VAR_IN_OUT
    RUNTIME1: UDINT;
    RUNTIME2: UDINT;
    CYCLES: UDINT;
END_VAR
VAR
    state: INT;
    last: TIME;
    tx: TIME;
    last_change: TIME;
    timer1: TON;
    timer2: TON;
    oil_temp_last: BOOL;
    cycles2: UDINT;
END_VAR

METHOD BurnerControl: BOOL
    (* Internal Function to Control Burner *)
    VAR
        t1, t2, t3, t4, t5, t6: TIME;
    END_VAR

    t1 := PRE_HEAT_TIME;
    t2 := t1 + PRE_VENT_TIME;
    t3 := t2 + PRE_IGNITE_TIME;
    t4 := t3 + SAFETY_TIME;
    t5 := t4 + POST_IGNITE_TIME;
    t6 := t5 + STAGE2_DELAY;

    CASE state OF
        110:
            (* Wait for Start Signal (Standby) *)
            IF IN THEN
                state := 111;  (* Move to Startup Sequence *)
                last_change := tx;
            END_IF;
        111:
            (* Startup Sequence *)
            IF NOT OVER_TEMP THEN
                IF (NOT MULTIPLE_IGNITION AND timer1.IN) OR (MULTIPLE_IGNITION) THEN
                    (* Fuel Oil Warming *)
                    PRE_HEAT := TRUE;
                    IF (NOT OIL_TEMP AND (tx - last_change) <= PRE_HEAT_TIME) THEN
                        FAIL := TRUE;  (* Error: Fuel Oil Warming not responded within PRE_HEAT_TIME *)
                        STATUS := 1;
                        RETURN FALSE;
                    END_IF;
                    PRE_HEAT := FALSE;
                ELSE
                    FAIL := TRUE;  (* Error: Flame Sensor active during Fuel Oil Warming *)
                    STATUS := 2;
                    RETURN FALSE;
                END_IF;

                (* Pre-Purge (PRE_VENT_TIME) *)
                MOTOR := TRUE;
                COIL1 := TRUE;
                timer1(IN := TRUE, PT := t2);
                IF (FLAME AND (tx - last_change) <= PRE_VENT_TIME) THEN
                    FAIL := TRUE;  (* Error: Flame Sensor active during Pre-Purge *)
                    STATUS := 3;
                    RETURN FALSE;
                END_IF;

                (* Ignition *)
                COIL1 := FALSE;
                COIL2 := TRUE;
                IGNITE := TRUE;
                timer1(IN := TRUE, PT := t3);
                IF (NOT FLAME AND (tx - last_change) >= SAFETY_TIME) THEN
                    FAIL := TRUE;  (* Error: Safety time passed without flame *)
                    STATUS := 4;
                    RETURN FALSE;
                END_IF;
                IGNITE := FALSE;
                COIL2 := FALSE;
            END_IF;

            (* Stage 1 *)
            IF (tx - last_change) >= t4 THEN
                state := 112;
                last_change := tx;
            END_IF;
        112:
            (* Burner runs at Stage 1 *)
            MOTOR := TRUE;
            COIL1 := TRUE;
            timer1(IN := TRUE);
            KWH := KWH + KW1 * timer1.PT;
            RUNTIME1 := timer1.ET;
            IF (NOT FLAME) THEN
                FAIL := TRUE;  (* Error: Flame stops in operation *)
                STATUS := 5;
                RETURN FALSE;
            END_IF;

            (* Multiple Ignition *)
            IF (FLAME AND MULTIPLE_IGNITION AND (tx - last_change) <= POST_IGNITE_TIME) THEN
                state := 111;  (* Immediately start ignition for stage 1 *)
            END_IF;

            (* Stage 2 Activation *)
            IF STAGE2 AND (tx - last_change) >= t6 THEN
                state := 113;
                last_change := tx;
            END_IF;
        113:
            (* Burner runs at Stage 2 *)
            MOTOR := TRUE;
            COIL2 := TRUE;
            timer2(IN := TRUE);
            KWH := KWH + KW2 * timer2.PT;
            RUNTIME2 := timer2.ET;
    END_CASE;

    (* Check for RST (Reset) *)
    IF RST THEN
        IF (tx - last_change) >= LOCKOUT_TIME AND NOT RST_TIMER THEN
            RST_TIMER := TRUE;  (* Lockout Time Passed, Allow Reset *)
        END_IF;

        IF RST_TIMER THEN
            state := 110;  (* Reset, return to Standby *)
            last_change := tx;
            RST_TIMER := FALSE;
            CYCLES := CYCLES + 1;
        END_IF;
    END_IF;

    (* Check for Over-Temperature *)
    IF OVER_TEMP THEN
        state := 110;  (* Stop immediately every action and report error 9 *)
        FAIL := TRUE;
        STATUS := 9;
    END_IF;

    (* Update STATUS Output *)
    CASE state OF
        110: STATUS := 110;
        111: STATUS := 111;
        112: STATUS := 112;
        113: STATUS := 113;
    END_CASE;

    RETURN TRUE;
END_METHOD;
