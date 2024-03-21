// 28.13s
// 3
FUNCTION FC1001 : BOOL
VAR_INPUT
    MEW : REAL; // Measured value from the sensor
    SP : REAL; // Set point value
    HYS : REAL; // Hysteresis percentage
END_VAR
VAR_IN_OUT
    OUT : BOOL; // Output control
END_VAR
VAR
    P_HYS : REAL; // Positive hysteresis limit
    N_HYS : REAL; // Negative hysteresis limit
END_VAR

P_HYS := SP + (SP * HYS / 100.0); // Calculate the positive hysteresis limit
N_HYS := SP - (SP * HYS / 100.0); // Calculate the negative hysteresis limit

IF MEW >= P_HYS AND NOT OUT THEN
    OUT := TRUE; // Turn on output if measured value exceeds the positive hysteresis limit and output is currently off
ELSIF MEW <= N_HYS AND OUT THEN
    OUT := FALSE; // Turn off output if measured value falls below the negative hysteresis limit and output is currently on
END_IF

FC1001 := OUT; // Return the current state of the output

END_FUNCTION
