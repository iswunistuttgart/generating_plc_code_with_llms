// 16.0s
// 4
VAR_INPUT
    X : REAL;
END_VAR

VAR
    SigmoidResult : REAL;
END_VAR

SigmoidResult := 1 / (1 + EXP(-X));
