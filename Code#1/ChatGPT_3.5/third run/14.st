// 23.99s
// 4
FUNCTION FC1001 : BOOL
VAR_INPUT
    MeasuredValue: REAL;      // Measured value from the sensor
    SwitchingValue: REAL;     // Predetermined switching value
    HysteresisPercent: REAL;  // Switching hysteresis in percentage
END_VAR

VAR_OUTPUT
    Output: BOOL;  // Output indicating the state (ON or OFF)
END_VAR

VAR
    HysteresisValue: REAL;  // Calculated hysteresis value based on percentage
    SwitchOnThreshold: REAL; // Threshold for switching ON
    SwitchOffThreshold: REAL; // Threshold for switching OFF
END_VAR

METHOD CheckSwitching
    HysteresisValue := SwitchingValue * HysteresisPercent / 100.0;

    SwitchOnThreshold := SwitchingValue + HysteresisValue;
    SwitchOffThreshold := SwitchingValue - HysteresisValue;

    IF MeasuredValue > SwitchOnThreshold THEN
        Output := TRUE;  // Switch ON
    ELSIF MeasuredValue < SwitchOffThreshold THEN
        Output := FALSE; // Switch OFF
    END_IF
END_METHOD

END_FUNCTION
