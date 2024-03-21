//9.
// 2
(* Program to implement the sign function *)

FUNCTION Sign(x: REAL): REAL
BEGIN
  IF x > 0.0 THEN
    RETURN(1.0);
  ELSIF x < 0.0 THEN
    RETURN(-1.0);
  ELSE
    RETURN(0.0);
  END_IF;
END_FUNCTION

(* Main program *)
PROGRAM Main
VAR
  x: REAL; (* Input value *)
  signVal: REAL; (* Sign function value *)
BEGIN
  x := 5.0; (* Example input value *)
  signVal := Sign(x);
  WRITE('Sign of', x, 'is', signVal);

  x := -3.2;
  signVal := Sign(x);
  WRITE('Sign of', x, 'is', signVal);

  x := 0.0;
  signVal := Sign(x);
  WRITE('Sign of', x, 'is', signVal);
END_PROGRAM