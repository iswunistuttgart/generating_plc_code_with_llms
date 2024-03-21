// 6.77s
// 4
FUNCTION FC1003 : VOID
VAR_INPUT
    IN_R: REAL;
    IN_MAX, IN_MIN: REAL;
    OUT_MAX, OUT_MIN: REAL;
END_VAR
VAR_OUTPUT
    OUT_R: REAL;
    FEH: BOOL;
END_VAR
VAR_TEMP
    DIFF1, DIFF2: REAL;
END_VAR

IF (IN_MAX <> IN_MIN) THEN
    // Calculate the difference between the input and output ranges
    DIFF1 := OUT_MAX - OUT_MIN;
    DIFF2 := IN_MAX - IN_MIN;

    // Perform the range mapping
    OUT_R := OUT_MIN + ((IN_R - IN_MIN) / DIFF2) * DIFF1;

    // Check for out-of-range conditions
    IF (OUT_R < OUT_MIN) THEN
        OUT_R := OUT_MIN;
        FEH := TRUE;  // Set error flag
    ELSIF (OUT_R > OUT_MAX) THEN
        OUT_R := OUT_MAX;
        FEH := TRUE;  // Set error flag
    ELSE
        FEH := FALSE; // No error
    END_IF;
ELSE
    // Avoid division by zero if IN_MAX is equal to IN_MIN
    OUT_R := OUT_MIN;
    FEH := TRUE;  // Set error flag
END_IF;
