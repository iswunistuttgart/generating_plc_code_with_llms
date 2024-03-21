//5.18s
//2
PROGRAM SigmoidFunction
VAR_INPUT
    x: REAL;  // Input value for the sigmoid function
END_VAR

VAR_OUTPUT
    sigmoidResult: REAL;  // Output value of the sigmoid function
END_VAR

METHOD CalculateSigmoid
    sigmoidResult := 1.0 / (1.0 + EXP(-x));
END_METHOD

END_PROGRAM
