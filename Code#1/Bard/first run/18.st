// 7.53s
// 2
FUNCTION FC1003(inputValue: REAL; IN_MIN: REAL; IN_MAX: REAL; OUT_MIN: REAL; OUT_MAX: REAL): REAL
VAR
  rangeRatio: REAL; (* Ratio between input and output ranges *)
  scaledValue: REAL; (* Scaled input value *)

BEGIN
  (* Calculate range ratio *)
  rangeRatio := (OUT_MAX - OUT_MIN) / (IN_MAX - IN_MIN);

  (* Scale input value to output range *)
  scaledValue := (inputValue - IN_MIN) * rangeRatio;

  (* Adjust scaled value to output range limits *)
  IF scaledValue < OUT_MIN THEN
    scaledValue := OUT_MIN;
  ELSIF scaledValue > OUT_MAX THEN
    scaledValue := OUT_MAX;
  END_IF;

  (* Return scaled input value *)
  RETURN scaledValue;
END_FUNCTION