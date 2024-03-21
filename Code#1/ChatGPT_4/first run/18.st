// 37.97s
// 4
FUNCTION FC1003 : REAL
VAR_INPUT
    InputValue : REAL;    // The value from the sensor (0 to 255 in your case)
    IN_MIN     : REAL;    // Lower limit of the input range
    IN_MAX     : REAL;    // Upper limit of the input range
    OUT_MIN    : REAL;    // Lower limit of the output range (e.g., -20C)
    OUT_MAX    : REAL;    // Upper limit of the output range (e.g., 40C)
END_VAR

BEGIN
    // Linearly map the input value from its range to the output range
    FC1003 := OUT_MIN + (InputValue - IN_MIN) * (OUT_MAX - OUT_MIN) / (IN_MAX - IN_MIN);
END_FUNCTION
