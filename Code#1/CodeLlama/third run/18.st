// 85.11468148231506s
// 3
```
FUNCTION_BLOCK FC1003
VAR_INPUT
    IN : REAL; (* input value from temperature sensor *)
    IN_MIN : REAL := 0.0; (* lower limit of original range *)
    IN_MAX : REAL := 255.0; (* upper limit of original range *)
    OUT_MIN : REAL := -20.0; (* lower limit of output range *)
    OUT_MAX : REAL := 40.0; (* upper limit of output range *)
END_VAR
VAR_OUTPUT
    OUT : REAL; (* output value for temperature *)
END_VAR
VAR
    RANGE_IN : REAL := IN_MAX - IN_MIN; (* range of original input values *)
    RANGE_OUT : REAL := OUT_MAX - OUT_MIN; (* range of output values *)
    MAP_IN : REAL := (RANGE_OUT / RANGE_IN) * (IN - IN_MIN); (* mapping from input to output *)
END_VAR
IF (IN >= IN_MIN AND IN <= IN_MAX) THEN
    OUT := OUT_MIN + MAP_IN;
ELSE
    OUT := 0.0;
END_IF;
END_FUNCTION_BLOCK
```