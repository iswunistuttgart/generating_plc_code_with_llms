// 32.44s
// 4
FUNCTION FC1003
VAR_INPUT
    DigitalInput: INT;  // Digital input value from the temperature sensor (0 to 255)
    IN_MIN: INT;        // Lower limit of the digital input range
    IN_MAX: INT;        // Upper limit of the digital input range
    OUT_MIN: REAL;      // Lower limit of the output temperature range
    OUT_MAX: REAL;      // Upper limit of the output temperature range
END_VAR

VAR_OUTPUT
    Temperature: REAL;  // Converted temperature value
END_VAR

VAR
    M: REAL;            // Slope of the linear interpolation
    C: REAL;            // Y-intercept of the linear interpolation
END_VAR

BEGIN
    // Ensure that the input limits are not equal to avoid division by zero
    IF IN_MIN <> IN_MAX THEN
        // Calculate the slope and y-intercept for linear interpolation
        M := (OUT_MAX - OUT_MIN) / (IN_MAX - IN_MIN);
        C := OUT_MIN - M * IN_MIN;

        // Perform linear interpolation to map the digital input to temperature
        Temperature := M * DigitalInput + C;
    ELSE
        // If input limits are equal, set Temperature to OUT_MIN
        Temperature := OUT_MIN;
    END_IF
END_FUNCTION
