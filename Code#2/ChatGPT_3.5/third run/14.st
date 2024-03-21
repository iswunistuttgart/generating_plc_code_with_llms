// 7.98s
// 2
FUNCTION FC1001 : BOOL
VAR_INPUT
	MEW: REAL;
	SP: REAL;
	HYS: REAL;
END_VAR

VAR_IN_OUT
 	OUT: BOOL;
END_VAR

VAR
 	P_HYS: REAL;
END_VAR

// Calculate the switching hysteresis value
P_HYS := SP * (HYS / 100.0);

// Switch on if the measured value exceeds the setpoint + hysteresis
IF MEW > (SP + P_HYS) THEN
    OUT := TRUE;
END_IF;

// Switch off if the measured value falls below the setpoint - hysteresis
IF MEW < (SP - P_HYS) THEN
    OUT := FALSE;
END_IF;

// Return the output state
RETURN OUT;

END_FUNCTION
