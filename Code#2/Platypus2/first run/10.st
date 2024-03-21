// 69.50946974754333s
// 2
PROGRAM sigmoid;

VAR_OUTPUT
    Y : REAL;
END_VAR

VAR
    A : REAL := 1.0;
    B : REAL := 1.0;
    C : REAL := 1.0;
    D : REAL := 1.0;
    E : REAL := 1.0;
END_VAR

PROCEDURE sigmoid(X: REAL);
BEGIN
    Y := A * (1.0 / (1.0 + EXP(-B * X)));
END_PROCEDURE

VAR_INPUT
    X : REAL;
END_VAR

VAR
    Y : REAL;
END_VAR

Y := sigmoid(X);