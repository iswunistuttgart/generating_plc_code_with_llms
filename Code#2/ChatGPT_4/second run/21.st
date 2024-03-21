// 144.85s
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
    state : INT := 0;  (* Operational state of the burner *)
    last : TIME;  (* Last time an operation started *)
    tx : TIME;  (* Transition time for next state *)
    last_change : TIME;  (* Last time state changed *)
    timer1 : TON;  (* Timer for various operational delays *)
    timer2 : TON;  (* Timer for lockout period *)
    oil_temp_last : BOOL := FALSE;  (* Last state of OIL_TEMP *)
    cycles2 : UDINT;  (* Cycle count for stage 2 *)
END_VAR

(* Reset functionality *)
IF RST THEN
    state := 0;
    FAIL := FALSE;
    STATUS := 110;  (* Wait for Start signal *)
    timer2(IN := FALSE);  (* Reset lockout timer *)
    MOTOR := FALSE;
    PRE_HEAT := FALSE;
    IGNITE := FALSE;
    COIL1 := FALSE;
    COIL2 := FALSE;
    RETURN;
END_IF;

(* Lockout timer check *)
timer2(IN := RST_TIMER, PT := LOCKOUT_TIME);
IF timer2.Q THEN
    RST_TIMER := FALSE;  (* Reset RST_TIMER after lockout period *)
END_IF;

(* Main state machine for burner operation *)
CASE state OF
    0:
        IF IN AND NOT OVER_TEMP AND NOT timer2.Q THEN
            state := 1;
            PRE_HEAT := TRUE;
            last_change := tx;
            timer1(IN := TRUE, PT := PRE_HEAT_TIME);
        END_IF;
    1:
        IF timer1.Q THEN
            IF NOT OIL_TEMP THEN
                FAIL := TRUE;
                STATUS := 1;  (* Fuel oil warming has not responded within PRE_HEAT_TIME *)
                state := 9;  (* Error state *)
            ELSE
                state := 2;  (* Proceed to next stage *)
                MOTOR := TRUE;
                last_change := tx;
                timer1(IN := TRUE, PT := PRE_VENT_TIME);  (* Start ventilation period *)
            END_IF;
        END_IF;
    2:
        IF timer1.Q THEN
            state := 3;
            IGNITE := TRUE;
            last_change := tx;
            timer1(IN := TRUE, PT := PRE_IGNITE_TIME + SAFETY_TIME);  (* Ignition and safety period *)
        END_IF;
    3:
        IF FLAME THEN
            state := 4;
            COIL1 := TRUE;  (* Burner running on stage 1 *)
            STATUS := 112;
            last_change := tx;
            RUNTIME1 := RUNTIME1 + 1;
            IF STAGE2 THEN
                timer1(IN := TRUE, PT := STAGE2_DELAY);  (* Delay for stage 2 activation *)
            END_IF;
        ELSIF timer1.Q THEN
            FAIL := TRUE;
            STATUS := 4;  (* Safety time was passed without a flame *)
            state := 9;  (* Error state *)
        END_IF;
    4:
        IF timer1.Q AND STAGE2 THEN
            state := 5;
            COIL2 := TRUE;  (* Burner running on stage 2 *)
            STATUS := 113;
            RUNTIME2 := RUNTIME2 + 1;
        END_IF;
    9:
        MOTOR := FALSE;
        PRE_HEAT := FALSE;
        IGNITE := FALSE;
        COIL1 := FALSE;
        COIL2 := FALSE;
        RST_TIMER := TRUE;  (* Start lockout timer *)
        state := 0;  (* Reset state after handling error *)
END_CASE;

(* Handle OVER_TEMP condition *)
IF OVER_TEMP THEN
    FAIL := TRUE;
    STATUS := 9;  (* Boiler overheating contact has tripped *)
    MOTOR := FALSE;
    PRE_HEAT := FALSE;
    IGNITE := FALSE;
    COIL1 := FALSE;
    COIL2 := FALSE;
    state := 9;  (* Set error state *)
END_IF;

END_FUNCTION_BLOCK
