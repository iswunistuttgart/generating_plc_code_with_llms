// 53.287253618240356s
// 2
PROGRAM test;

VAR
    X : REAL;
END_VAR

X := 0.5;

IF X > 1 THEN
    PRINT "Error: x must be less than or equal to 1.";
ELSE IF X < -1 THEN
    PRINT "Error: x must be greater than or equal to -1.";
END_IF;

PRINT "The hyperbolic sine of x is ";

REAL y := EXP(X * X);

PRINT y;