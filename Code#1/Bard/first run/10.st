//8.
// 2
(* Program to implement the sigmoid function *)

FUNCTION Sigmoid(x: REAL): REAL
BEGIN
  RETURN(1.0 / (1.0 + EXP(-x)));
END_FUNCTION

(* Main program *)
PROGRAM Main
VAR
  x: REAL; (* Input value *)
  y: REAL; (* Sigmoid function value *)

BEGIN
  x := 0.5; (* Example input value *)
  y := Sigmoid(x);
  WRITE('Sigmoid of', x, 'is', y);
END_PROGRAM