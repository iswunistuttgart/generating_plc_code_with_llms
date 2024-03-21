//7.55s
//2
PROGRAM Fibonacci
VAR
  n: INT;
  result: INT;
FUNCTION Fibonacci(n: INT): INT
VAR
  i: INT;
  a: INT;
  b: INT;
BEGIN
  IF n = 0 THEN
    Fibonacci := 0;
  ELSIF n = 1 THEN
    Fibonacci := 1;
  ELSE
    a := 0;
    b := 1;
    FOR i := 2 TO n DO
      result := a + b;
      a := b;
      b := result;
    END_FOR;
    Fibonacci := result;
  END_IF;
END_FUNCTION
END_PROGRAM
