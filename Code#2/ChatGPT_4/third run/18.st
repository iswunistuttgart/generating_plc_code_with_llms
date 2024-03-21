// 30.75s
// 4
FUNCTION FC1003 : VOID
VAR_INPUT
    IN_R : REAL; // Input value
    IN_MAX, IN_MIN : REAL; // Input range
    OUT_MAX, OUT_MIN : REAL; // Output range
END_VAR
VAR_OUTPUT
    OUT_R : REAL; // Output value
    FEH : BOOL; // Error flag
END_VAR
VAR_TEMP
    DIFF1, DIFF2 : REAL;
END_VAR

// Check for valid input range to prevent division by zero
IF IN_MAX = IN_MIN THEN
    FEH := TRUE; // Set error flag if input range is invalid
    RETURN;
END_IF;

// Calculate the difference in the ranges
DIFF1 := IN_MAX - IN_MIN;
DIFF2 := OUT_MAX - OUT_MIN;

// Perform the linear scaling
OUT_R := OUT_MIN + (IN_R - IN_MIN) * DIFF2 / DIFF1;

FEH := FALSE; // Clear error flag if operation is successful
END_FUNCTION
