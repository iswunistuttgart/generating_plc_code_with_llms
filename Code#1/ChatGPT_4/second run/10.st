//16.26s
//4
PROGRAM SigmoidFunction
VAR
    x: REAL;        // Input for the sigmoid function
    sigmoid: REAL;  // Result of the sigmoid function
END_VAR

// Calculate the sigmoid function
sigmoid := 1 / (1 + EXP(-x));

END_PROGRAM
