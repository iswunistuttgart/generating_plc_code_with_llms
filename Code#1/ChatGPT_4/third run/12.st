//30.77s
//4
FUNCTION HyperbolicSine : REAL
VAR_INPUT
    x : REAL; // Input to the hyperbolic sine function
END_VAR

// Hyperbolic sine calculation using the exponential function
HyperbolicSine := (EXP(x) - EXP(-x)) / 2.0;

END_FUNCTION
