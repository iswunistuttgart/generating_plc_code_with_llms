// 14.9s
// 4
VAR
    X : REAL; // Input value
    sinhX : REAL; // Result of hyperbolic sine function
END_VAR

// Implementing the hyperbolic sine function
sinhX := (EXP(X) - EXP(-X)) / 2;
