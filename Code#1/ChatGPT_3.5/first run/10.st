//7.60s
//2
FUNCTION Sigmoid : REAL
VAR_INPUT
    x: REAL;  // Input value for the sigmoid function
END_VAR_INPUT
VAR_OUTPUT
    result: REAL;  // Result of the sigmoid function
END_VAR_OUTPUT

VAR
    exp_neg_x: REAL;
BEGIN
    exp_neg_x := EXP(-x);
    result := 1 / (1 + exp_neg_x);
END_FUNCTION
