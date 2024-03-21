// 8.03s
// 2
FUNCTION FC1002 : BOOL
VAR_INPUT
    E_A : BOOL;
    SENSOR : BOOL;
    ZEITW : TIME;
END_VAR
VAR_IN_OUT
    ZEIT : TON;
    P_HU : BOOL;
    P_AL : BOOL;
END_VAR

START

    IF (E_A = TRUE) AND (SENSOR = TRUE) THEN
        ZEIT := 0;
    ELSIF ZEIT > 3 THEN
        P_HU := FALSE;
        P_AL := TRUE;
    ELSIF ZEIT = 3 THEN
        P_HU := FALSE;
    ELSE
        IF ZEIT > 0 THEN
            ZEIT := ZEIT + 1;
        ELSE
            P_HU := TRUE;
        END_IF;
    END_IF;

    RETURN P_AL;
END_FUNCTION