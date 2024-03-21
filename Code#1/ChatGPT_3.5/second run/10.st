//6.25
//4
FUNCTION Sigmoid: REAL
VAR_INPUT
    x: REAL;  // Input value
END_VAR

VAR
    e_to_power_minus_x: REAL;
END_VAR

BEGIN
    e_to_power_minus_x := EXP(-x);
    Sigmoid := 1 / (1 + e_to_power_minus_x);
END_FUNCTION
