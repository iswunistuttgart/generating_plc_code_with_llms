// 8.59s
// 3
FUNCTION_BLOCK FB1005
VAR_INPUT
  START: BOOL;
  DIKKE: REAL;
  V_MAX: REAL;
  V_MIN: REAL;
END_VAR
VAR_OUTPUT
  D_MAX: REAL;
  D_MIN: REAL;
  P1: BOOL;
END_VAR
VAR
  FO: BOOL;
END_VAR

START

    IF START = TRUE THEN
        FO := TRUE;
        D_MAX := DIKKE;
        D_MIN := DIKKE;
    ELSE
        FO := FALSE;
    END_IF;

    IF FO = TRUE THEN
        IF DIKKE > D_MAX THEN
            D_MAX := DIKKE;
        ELSIF DIKKE < D_MIN THEN
            D_MIN := DIKKE;
        END_IF;

        IF D_MAX > V_MAX THEN
            P1 := TRUE;
        ELSIF D_MIN < V_MIN THEN
            P1 := TRUE;
        ELSE
            P1 := FALSE;
        END_IF;
    END_IF;
END_START