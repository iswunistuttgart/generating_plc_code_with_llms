//8.29s
//2
(* Program to calculate a Fibonacci number *)

VAR
  n: INT; (* Fibonacci number to calculate *)
  result: INT; (* Calculated Fibonacci number *)

(* Main program *)
PROGRAM Main
BEGIN
  n := 10;
  result := Fibonacci(n);
  WRITE('The Fibonacci number of', n, 'is', result);
END_PROGRAM

(* Function to calculate a Fibonacci number *)
FUNCTION Fibonacci(n: INT): INT
BEGIN
  IF n = 0 THEN
    RETURN(0);
  ELSIF n = 1 THEN
    RETURN(1);
  ELSE
    RETURN(Fibonacci(n - 1) + Fibonacci(n - 2));
  END_IF;
END_FUNCTION