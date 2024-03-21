// 18.72s
// 4
PROGRAM HyperbolicSineFunction
VAR
    X : REAL; // Input for the hyperbolic sine function
    sinhX : REAL; // Result of the hyperbolic sine function
END_VAR

// Calculating the hyperbolic sine of X
sinhX := (EXP(X) - EXP(-X)) / 2;
