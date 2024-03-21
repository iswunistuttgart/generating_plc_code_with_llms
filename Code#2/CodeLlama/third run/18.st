// 50.14126205444336s
// 2
```
FUNCTION FC1003 : VOID
VAR_INPUT
    IN_R:REAL;
    IN_MAX, IN_MIN:REAL;
    OUT_MAX, OUT_MIN:REAL;
END_VAR
VAR_OUTPUT
    OUT_R:REAL;
    FEH:BOOL;
END_VAR
VAR_TEMP
    DIFF1, DIFF2:REAL;
END_VAR
BEGIN
    IF IN_MAX = IN_MIN THEN
        FEH := FALSE;
        OUT_R := 0.0;
    ELSE
        DIFF1 := (IN_MAX - IN_MIN) / 255.0;
        DIFF2 := (OUT_MAX - OUT_MIN) / (IN_MAX - IN_MIN);
        IF IN_R < IN_MIN THEN
            FEH := FALSE;
            OUT_R := OUT_MIN;
        ELSEIF IN_R > IN_MAX THEN
            FEH := FALSE;
            OUT_R := OUT_MAX;
        ELSE
            FEH := TRUE;
            OUT_R := OUT_MIN + DIFF2 * (IN_R - IN_MIN);
        END_IF;
    END_IF;
END_FUNCTION
```