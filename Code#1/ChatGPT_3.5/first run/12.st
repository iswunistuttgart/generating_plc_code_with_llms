//8.05s
//2
FUNCTION HyperbolicSine : REAL
VAR_INPUT
    x: REAL;  // Input value for the hyperbolic sine function
END_VAR_INPUT
VAR_OUTPUT
    result: REAL;  // Result of the hyperbolic sine function
END_VAR_OUTPUT

VAR
    exp_x: REAL;
    exp_neg_x: REAL;
BEGIN
    exp_x := EXP(x);
    exp_neg_x := EXP(-x);
    result := (exp_x - exp_neg_x) / 2;
END_FUNCTION
