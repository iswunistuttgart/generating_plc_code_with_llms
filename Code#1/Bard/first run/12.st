//8.59s
// 2
(* Program to implement the hyperbolic sine function using the exponential function *)

FUNCTION Sinh(x: REAL): REAL
BEGIN
  RETURN((EXP(x) - EXP(-x)) / 2.0);
END_FUNCTION

(* Main program *)
PROGRAM Main
VAR
  x: REAL; (* Input value *)
  sinhVal: REAL; (* Hyperbolic sine function value *)
BEGIN
  x := 1.0; (* Example input value *)
  sinhVal := Sinh(x);
  WRITE('Sinh of', x, 'is', sinhVal);
END_PROGRAM