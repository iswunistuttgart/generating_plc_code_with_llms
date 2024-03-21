// 13.26s
// 2
FUNCTION FC1001(measuredValue: REAL, switchingValue: REAL, hysteresis: REAL): BOOL
VAR
previousOutput: BOOL; (* Flag indicating the previous output state )
switchingThreshold: REAL; ( Hysteresis-adjusted switching value *)

BEGIN
previousOutput := FALSE; (* Initialize previous output state to FALSE )
switchingThreshold := switchingValue * (1.0 - hysteresis / 100.0); ( Calculate the hysteresis-adjusted switching threshold *)

IF measuredValue >= switchingThreshold THEN
IF NOT previousOutput THEN
previousOutput := TRUE;
RETURN TRUE; (* Switch output on *)
END_IF;

RETURN previousOutput; (* Maintain output state *)
ELSE
IF previousOutput THEN
previousOutput := FALSE;
RETURN FALSE; (* Switch output off *)
END_IF;

RETURN previousOutput; (* Maintain output state *)
END_IF;
END_FUNCTION