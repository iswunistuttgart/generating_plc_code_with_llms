// 65.56758427619934s
// 4
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
    FACTOR : REAL := RANGE_OUT / RANGE_IN; (* factor for scaling *)
END_VAR
IF IN < IN_MIN THEN
    OUT := OUT_MIN;
ELSIF IN > IN_MAX THEN
    OUT := OUT_MAX;
ELSE
    OUT := (IN - IN_MIN) * FACTOR + OUT_MIN; (* scale input value *)
END_IF
END_FUNCTION_BLOCK
```