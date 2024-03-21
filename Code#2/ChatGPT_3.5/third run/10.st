// 4.04s
// 4
VAR_INPUT
    X : REAL;
END_VAR

VAR
    sigmoidResult : REAL;
END_VAR

// Sigmoid function implementation
sigmoidResult := 1 / (1 + EXP(-X));
