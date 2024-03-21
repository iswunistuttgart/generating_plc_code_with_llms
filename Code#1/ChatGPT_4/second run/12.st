//14.62s
//4
PROGRAM HyperbolicSine
VAR
    x: REAL;           // Input variable
    sinh_x: REAL;      // Result of hyperbolic sine of x
END_VAR

// Calculate the hyperbolic sine of x
sinh_x := (EXP(x) - EXP(-x)) / 2;

END_PROGRAM
