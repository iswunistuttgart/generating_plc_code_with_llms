//7.32s
//4
FUNCTION HyperbolicSine: REAL
VAR_INPUT
    x: REAL;  // Input value
END_VAR

VAR
    sinh_result: REAL;
END_VAR

BEGIN
    sinh_result := (EXP(x) - EXP(-x)) / 2.0;
    HyperbolicSine := sinh_result;
END_FUNCTION
