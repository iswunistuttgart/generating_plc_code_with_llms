// 5.26s
// 4
VAR
    X : REAL;
END_VAR

VAR
    result : REAL;
END_VAR

(* Hyperbolic sine function implementation *)
result := (EXP(X) - EXP(-X)) / 2.0;
