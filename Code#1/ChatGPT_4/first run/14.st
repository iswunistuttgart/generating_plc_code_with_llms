// 41.85s
// 4
FUNCTION FC1001 : BOOL
VAR_INPUT
    MeasuredValue : REAL;  // The current measured value from the sensor
    SwitchValue   : REAL;  // The predetermined switch value
    Hysteresis    : REAL;  // The hysteresis in percentage of the switch value
END_VAR

VAR
    UpperLimit : REAL;
    LowerLimit : REAL;
END_VAR

// Calculate the upper and lower limits based on the hysteresis
UpperLimit := SwitchValue + (SwitchValue * Hysteresis / 100);
LowerLimit := SwitchValue - (SwitchValue * Hysteresis / 100);

// Logic to turn the output on or off based on the measured value and hysteresis
IF MeasuredValue > UpperLimit THEN
    FC1001 := TRUE;  // Turn on the output
ELSIF MeasuredValue < LowerLimit THEN
    FC1001 := FALSE; // Turn off the output
// If the value is within the hysteresis range, keep the output as is
END_IF
