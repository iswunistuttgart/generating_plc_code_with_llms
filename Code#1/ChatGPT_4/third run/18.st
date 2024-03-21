// 41.17s
// 2
FUNCTION FC1003 : REAL
VAR_INPUT
    InputValue: WORD; // The input value from the temperature sensor (0 to 255)
    IN_MIN, IN_MAX: WORD; // Input range lower and upper limits
    OUT_MIN, OUT_MAX: REAL; // Output range lower and upper limits
END_VAR

BEGIN
    // Linear interpolation
    FC1003 := OUT_MIN + ((REAL(InputValue) - REAL(IN_MIN)) * (OUT_MAX - OUT_MIN)) / (REAL(IN_MAX) - REAL(IN_MIN));
END_FUNCTION
