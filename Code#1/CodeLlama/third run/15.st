// 32.375247955322266s
// 3 (macht nicht alles was es soll)
```
FUNCTION_BLOCK FC1002
VAR
    P_HU : BOOL;
    P_AL : BOOL;
    E_A : BOOL;
    P1 : BOOL;
END_VAR
IF E_A THEN
    IF NOT P1 THEN
        P1 := TRUE;
        P_HU := FALSE;
        P_AL := FALSE;
    END_IF;
ELSE
    IF P1 THEN
        P1 := FALSE;
        P_HU := FALSE;
        P_AL := FALSE;
    END_IF;
END_IF;
END_FUNCTION_BLOCK
```