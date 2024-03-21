// 10.17s
// 2
FUNCTION FC1001(measured_value: REAL, switching_value: REAL, hysteresis_percent: REAL): BOOL

VAR
  previous_value: REAL;
  switching_threshold: REAL;
  output_state: BOOL;

(* Initialize variables *)
previous_value := measured_value;
switching_threshold := switching_value * (1.0 + hysteresis_percent / 100.0);

(* Compare measured value with switching threshold *)
IF measured_value >= switching_threshold THEN
  (* Measured value exceeds threshold, turn on output if it was previously off *)
  IF NOT previous_value >= switching_threshold THEN
    output_state := TRUE;
  END_IF;
ELSE
  (* Measured value below threshold, turn off output if it was previously on *)
  IF previous_value >= switching_threshold THEN
    output_state := FALSE;
  END_IF;
END_IF;

(* Update previous value for next cycle *)
previous_value := measured_value;

(* Return output state *)
RETURN output_state;

END_FUNCTION
