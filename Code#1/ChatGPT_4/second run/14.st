// 60.33s
// 2
FUNCTION FC1001 : BOOL
VAR_INPUT
    measuredValue : REAL;  // Sensor reading
    switchingValue : REAL; // Predetermined switching value
    hysteresis : REAL;     // Hysteresis in percentage of the switching value
END_VAR

VAR
    hysteresisValue : REAL;
    static lastState : BOOL := FALSE;
END_VAR

// Calculate the hysteresis value
hysteresisValue := switchingValue * (hysteresis / 100.0);

// Switching logic with hysteresis
IF measuredValue > (switchingValue + hysteresisValue) THEN
    lastState := TRUE;  // Turn on the output
ELSIF measuredValue < (switchingValue - hysteresisValue) THEN
    lastState := FALSE; // Turn off the output
END_IF

FC1001 := lastState;

END_FUNCTION
