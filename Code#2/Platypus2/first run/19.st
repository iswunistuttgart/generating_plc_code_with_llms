// 154.3342866897583s
// 2
FUNCTION_BLOCK FB1005
VAR_INPUT
    START:BOOL; 
    DICKE, V_MAX, V_MIN:REAL;
END_VAR
VAR_OUTPUT
    D_MAX, D_MIN:REAL; 
    P1:BOOL;
END_VAR
VAR
    FO:BOOL;
END_VAR
IF START THEN
    DICKE := 0.0;
    V_MAX := 0.0;
    V_MIN := 0.0;
    D_MAX := 0.0;
    D_MIN := 0.0;
    P1 := FALSE;
ELSE
    DICKE := 0.0;
    V_MAX := 0.0;
    V_MIN := 0.0;
    D_MAX := 0.0;
    D_MIN := 0.0;
    P1 := FALSE;
ENDIF
IF START THEN
    IF (DICKE > V_MAX) OR (DICKE < V_MIN) THEN
        P1 := TRUE;
    END_IF
ELSE
    IF (DICKE > V_MAX) OR (DICKE < V_MIN) THEN
        P1 := TRUE;
    END_IF
ENDIF
END_FUNCTION_BLOCK