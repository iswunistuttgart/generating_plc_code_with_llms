// 34.21s
// 4
FUNCTION FC1003 : REAL
VAR_INPUT
    digitalValue : REAL;   // Digital input value (e.g., 0 to 255)
    IN_MIN : REAL;         // Lower limit of the input range
    IN_MAX : REAL;         // Upper limit of the input range
    OUT_MIN : REAL;        // Lower limit of the output range (e.g., -20°C)
    OUT_MAX : REAL;        // Upper limit of the output range (e.g., 40°C)
END_VAR

VAR
    scaleFactor : REAL;
    offset : REAL;
END_VAR

BEGIN
    // Calculate the scale factor and offset for linear mapping
    scaleFactor := (OUT_MAX - OUT_MIN) / (IN_MAX - IN_MIN);
    offset := OUT_MIN - scaleFactor * IN_MIN;

    // Apply linear mapping
    FC1003 := scaleFactor * digitalValue + offset;
END_FUNCTION
