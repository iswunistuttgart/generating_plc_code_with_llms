// 71.71412825584412s
// 3
```
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
PROGRAM
    IF START THEN
        FO := TRUE;
        D_MAX := 0.0;
        D_MIN := 0.0;
        P1 := FALSE;
    END_IF;
    IF FO AND NOT(START) THEN
        IF DICKE > V_MAX OR DICKE < V_MIN THEN
            P1 := TRUE;
        ELSE
            P1 := FALSE;
        END_IF;
        IF DICKE > D_MAX THEN
            D_MAX := DICKE;
        END_IF;
        IF DICKE < D_MIN THEN
            D_MIN := DICKE;
        END_IF;
    END_IF;
END_PROGRAM
```