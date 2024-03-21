// 13.41s
// 4
VAR
    X : REAL;         (* Input for the hyperbolic sine function *)
    SinhResult : REAL; (* Result of sinh(x) *)
END_VAR

SinhResult := (EXP(X) - EXP(-X)) / 2;
