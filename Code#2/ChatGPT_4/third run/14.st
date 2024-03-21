// 60.89s
// 4
FUNCTION FC1001 : BOOL
VAR_INPUT
    MEW: REAL; // Measured value
    SP: REAL;  // Setpoint
    HYS: REAL; // Hysteresis in percentage of the setpoint
END_VAR
VAR_IN_OUT
    OUT: BOOL; // Output control
END_VAR
VAR
    P_HYS: REAL; // Hysteresis value
END_VAR

P_HYS := SP * HYS / 100.0; // Calculate hysteresis value

IF OUT THEN
    // Check if the measured value falls below the setpoint minus hysteresis
    IF MEW < (SP - P_HYS) THEN
        OUT := FALSE;
    END_IF;
ELSE
    // Check if the measured value exceeds the setpoint plus hysteresis
    IF MEW > (SP + P_HYS) THEN
        OUT := TRUE;
    END_IF;
END_IF;

FC1001 := OUT; // Set function return value
END_FUNCTION
