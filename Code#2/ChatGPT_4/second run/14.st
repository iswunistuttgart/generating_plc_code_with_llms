// 34.95s
// 4
FUNCTION FC1001 : BOOL
VAR_INPUT
    MEW: REAL;  (* Measured value from the sensor *)
    SP: REAL;   (* Setpoint value *)
    HYS: REAL;  (* Hysteresis percentage *)
END_VAR
VAR_IN_OUT
    OUT: BOOL;  (* Output to be controlled *)
END_VAR
VAR
    P_HYS: REAL;  (* Absolute hysteresis value *)
END_VAR

P_HYS := SP * HYS / 100.0;  (* Calculate the hysteresis value *)

IF MEW > (SP + P_HYS) THEN
    OUT := TRUE;  (* Turn on output if measured value exceeds SP + hysteresis *)
ELSIF MEW < (SP - P_HYS) THEN
    OUT := FALSE;  (* Turn off output if measured value falls below SP - hysteresis *)
END_IF;

FC1001 := OUT;  (* Return the current state of the output *)

END_FUNCTION
