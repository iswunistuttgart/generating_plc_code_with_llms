// 24.24s
// 4
VAR_INPUT
    X : REAL; // Input to the sigmoid function
END_VAR

VAR
    Sigmoid : REAL; // Result of the sigmoid function
END_VAR

// Implementing the sigmoid function
Sigmoid := 1 / (1 + EXP(-X));
