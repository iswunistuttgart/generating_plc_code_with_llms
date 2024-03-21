// 7.18s
// 2
FUNCTION FC1001 :BOOL
VAR_INPUT
    MEW: REAL;
    SP: REAL;
    HYS: REAL;
END_VAR
VAR_IN_OUT
    OUT:BOOL;
END_VAR
VAR
    P_HYS: REAL;
END_VAR
    // Calculate the switching hysteresis as a percentage of the setpoint
    P_HYS := SP * HYS / 100.0;

    // Check if the measured value exceeds the upper threshold
    IF MEW > SP + P_HYS THEN
        OUT := TRUE;
    ELSIF MEW < SP - P_HYS THEN
        OUT := FALSE;
    END_IF;

    // Return the output status
    RETURN OUT;
END_FUNCTION
