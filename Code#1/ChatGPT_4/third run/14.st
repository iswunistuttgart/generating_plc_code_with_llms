// 39.74s
// 4
FUNCTION FC1001 : BOOL
VAR_INPUT
    MeasuredValue: REAL; // Sensor measured value
    SwitchingValue: REAL; // Predeterminable switching value
    HysteresisPct: REAL; // Hysteresis percentage
END_VAR

VAR
    HysteresisValue: REAL;
END_VAR

BEGIN
    // Calculate the hysteresis value
    HysteresisValue := (SwitchingValue * HysteresisPct) / 100.0;

    // Check if the measured value exceeds the switching value + hysteresis
    IF MeasuredValue > (SwitchingValue + HysteresisValue) THEN
        FC1001 := TRUE; // Turn on the output
    ELSIF MeasuredValue < (SwitchingValue - HysteresisValue) THEN
        FC1001 := FALSE; // Turn off the output
    END_IF;
END_FUNCTION
