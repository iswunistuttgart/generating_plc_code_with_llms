//27.6s
//4
FUNCTION Sigmoid : REAL
VAR_INPUT
    x : REAL; // Input to the sigmoid function
END_VAR

// Sigmoid function calculation
Sigmoid := 1.0 / (1.0 + EXP(-x));

END_FUNCTION
