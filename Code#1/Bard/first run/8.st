//11.18s
// 2
(* Program to implement the Lambert W function *)

CONST
  EPSILON = 1e-6; (* Tolerance for the iteration *)
  MAX_ITERATIONS = 100; (* Maximum number of iterations *)

(* Function to calculate the Lambert W function *)
FUNCTION LambertW(x: REAL): REAL
VAR
  y: REAL; (* Initial approximation *)
  w: REAL; (* Lambert W function value *)
  i: INT; (* Iteration counter *)

BEGIN
  y := log(x);
  FOR i := 1 TO MAX_ITERATIONS DO
    w := y - x * EXP(-y);
    IF ABS(w - y) < EPSILON THEN
      RETURN(w);
    END_IF;
    y := w;
  END_FOR;
  RETURN(0.0); (* No convergence *)
END_FUNCTION

(* Main program *)
PROGRAM Main
VAR
  x: REAL; (* Input value *)
  w: REAL; (* Lambert W function value *)

BEGIN
  x := 1.5; (* Example input value *)
  w := LambertW(x);
  WRITE('Lambert W of', x, 'is', w);
END_PROGRAM