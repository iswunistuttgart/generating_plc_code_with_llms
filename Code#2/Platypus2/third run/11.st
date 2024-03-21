// 37.72031283378601s
// 2
PROGRAM sign;

VAR_OUTPUT
    y : REAL;
END_VAR

VAR_INPUT
    x : REAL;
END_VAR

IF x < 0 THEN
    y := -x;
ELSE
    y := x;
ENDIF;

RETURN;