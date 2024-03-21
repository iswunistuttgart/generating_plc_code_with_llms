// 27.5s
// 3
FUNCTION FC1001
VAR_INPUT
    MeasuredValue: REAL;           // Measured value from the sensor
    SwitchingValue: REAL;          // Predeterminable switching value
    HysteresisPercentage: REAL;    // Switching hysteresis in % of the switching value
    SwitchedOn: BOOL;              // Output indicating if the output should be switched on or off
END_VAR

VAR
    SwitchingThresholdHigh: REAL;  // Threshold for switching on
    SwitchingThresholdLow: REAL;   // Threshold for switching off
    OutputState: BOOL;             // Current state of the output
END_VAR

BEGIN
    // Calculate switching thresholds based on the hysteresis
    SwitchingThresholdHigh := SwitchingValue * (1 + HysteresisPercentage / 100.0);
    SwitchingThresholdLow := SwitchingValue * (1 - HysteresisPercentage / 100.0);

    // Determine the output state based on the measured value and thresholds
    IF MeasuredValue > SwitchingThresholdHigh THEN
        OutputState := TRUE;  // Switched on
    ELSIF MeasuredValue < SwitchingThresholdLow THEN
        OutputState := FALSE; // Switched off
    END_IF

    // Update the output state based on the control input
    IF SwitchedOn THEN
        OutputState := TRUE;
    ELSE
        OutputState := FALSE;
    END_IF

    // Return the current state of the output
    FC1001 := OutputState;
END_FUNCTION
