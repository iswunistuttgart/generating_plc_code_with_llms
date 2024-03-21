// 29.85s
// 4
FUNCTION FC1003 : VOID
VAR_INPUT
    IN_R : REAL; // Input reading
    IN_MAX : REAL; // Upper limit of input range
    IN_MIN : REAL; // Lower limit of input range
    OUT_MAX : REAL; // Upper limit of output range
    OUT_MIN : REAL; // Lower limit of output range
END_VAR
VAR_OUTPUT
    OUT_R : REAL; // Mapped output reading
    FEH : BOOL; // Error flag
END_VAR
VAR_TEMP
    DIFF1 : REAL; // Difference in input range
    DIFF2 : REAL; // Difference in output range
END_VAR

DIFF1 := IN_MAX - IN_MIN; // Calculate the span of the input range
DIFF2 := OUT_MAX - OUT_MIN; // Calculate the span of the output range

// Check for valid input range
IF DIFF1 = 0 THEN
    FEH := TRUE; // Set error flag if input range is invalid
    RETURN;
END_IF

// Linear interpolation
OUT_R := (((IN_R - IN_MIN) / DIFF1) * DIFF2) + OUT_MIN;

// Error checking
FEH := (IN_R < IN_MIN) OR (IN_R > IN_MAX); // Set error flag if input is out of range

END_FUNCTION
