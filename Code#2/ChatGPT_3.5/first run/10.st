// 5.01s
// 4
VAR_INPUT
    X : REAL;
END_VAR

VAR
    result : REAL;
END_VAR

(* Sigmoid function implementation *)
result := 1.0 / (1.0 + EXP(-X));
