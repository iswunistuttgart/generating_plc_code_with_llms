// 8.55s
// 2
FUNCTION FC1003
VAR_INPUT
    DigitalInput: INT;  // Digital input value (0 to 255)
    IN_MIN: INT;        // Lower limit of the original range
    IN_MAX: INT;        // Upper limit of the original range
    OUT_MIN: REAL;      // Lower limit of the output range
    OUT_MAX: REAL;      // Upper limit of the output range
END_VAR_INPUT

VAR_OUTPUT
    Temperature: REAL;  // Converted temperature value
END_VAR_OUTPUT

VAR
    M: REAL;            // Slope of the linear mapping
    B: REAL;            // Y-intercept of the linear mapping
END_VAR

// Calculate the slope and y-intercept for the linear mapping
M := (OUT_MAX - OUT_MIN) / (IN_MAX - IN_MIN);
B := OUT_MIN - M * IN_MIN;

// Perform the linear mapping to convert DigitalInput to Temperature
Temperature := M * DigitalInput + B;

END_FUNCTION
