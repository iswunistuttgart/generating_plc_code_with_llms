// 6.88s
// 2
FUNCTION FC1003

VAR
  IN_MIN: REAL;
  IN_MAX: REAL;
  OUT_MIN: REAL;
  OUT_MAX: REAL;
  temperature: REAL;

(* Initialization *)
IN_MIN := -20.0;
IN_MAX := 40.0;
OUT_MIN := 0.0;
OUT_MAX := 255.0;

(* Check input value *)
IF input_value >= IN_MIN AND input_value <= IN_MAX THEN
  (* Calculate temperature *)
  temperature := ((input_value - IN_MIN) / (IN_MAX - IN_MIN)) * (OUT_MAX - OUT_MIN) + OUT_MIN;

  (* Check if temperature is within output range *)
  IF temperature < OUT_MIN THEN
    temperature := OUT_MIN;
  ELSIF temperature > OUT_MAX THEN
    temperature := OUT_MAX;
  END_IF;
END_IF;

(* Return temperature *)
RETURN temperature;

END_FUNCTION
