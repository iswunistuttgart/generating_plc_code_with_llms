// 8.76s
// 2 (VAR an falscher Stelle, eigtl. 4)
FUNCTION FC1003 : REAL
VAR_INPUT
    DigitalInput: INT;  // Digital input value (0 to 255)
    IN_MIN: REAL;       // Lower limit of the original range
    IN_MAX: REAL;       // Upper limit of the original range
    OUT_MIN: REAL;      // Lower limit of the output range
    OUT_MAX: REAL;      // Upper limit of the output range
END_VAR

VAR_OUTPUT
    Temperature: REAL;  // Converted temperature value
END_VAR

METHOD MapTemperature
    // Ensure that the input is within the specified range
    IF DigitalInput < 0 THEN
        DigitalInput := 0;
    ELSIF DigitalInput > 255 THEN
        DigitalInput := 255;
    END_IF

    // Perform range mapping using linear interpolation
    Temperature := OUT_MIN + (OUT_MAX - OUT_MIN) / (IN_MAX - IN_MIN) * (DigitalInput - IN_MIN);
END_METHOD

END_FUNCTION
