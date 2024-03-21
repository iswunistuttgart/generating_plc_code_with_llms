// 8.25s
// 4
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

IF IN_MAX <> IN_MIN AND OUT_MAX <> OUT_MIN THEN
    // Calculate the difference between input and output ranges
    DIFF1 := IN_MAX - IN_MIN;
    DIFF2 := OUT_MAX - OUT_MIN;

    // Check if the input value is within the specified range
    IF IN_R >= IN_MIN AND IN_R <= IN_MAX THEN
        // Map the input value to the output range
        OUT_R := ((IN_R - IN_MIN) / DIFF1) * DIFF2 + OUT_MIN;
        FEH := FALSE;
    ELSE
        // Input value is out of range
        OUT_R := 0.0;
        FEH := TRUE;
    END_IF;
ELSE
    // Invalid range configuration
    OUT_R := 0.0;
    FEH := TRUE;
END_IF;
