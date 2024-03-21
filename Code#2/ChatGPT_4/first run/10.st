// 14.15s
// 4
PROGRAM SigmoidFunction
VAR_INPUT
    X : REAL; // Input for the sigmoid function
END_VAR
VAR
    sigmoidX : REAL; // Result of the sigmoid function
END_VAR

// Calculating the sigmoid of X
sigmoidX := 1 / (1 + EXP(-X));
