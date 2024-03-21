// 8.02s
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

(* FC1001 function implementation *)
IF MEW > (SP + P_HYS) THEN
    OUT := TRUE;
ELSIF MEW < (SP - P_HYS) THEN
    OUT := FALSE;
END_IF;

(* Update the hysteresis for the next cycle *)
P_HYS := SP * HYS / 100;

(* Return the output state *)
RETURN OUT;
