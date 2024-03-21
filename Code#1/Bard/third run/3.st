//10.15s
// 2
PROGRAM Fibonacci

VAR
  n: INT;
  result: INT;

FUNCTION Fibonacci(n: INT): INT;
VAR
  a: INT;
  b: INT;
  i: INT;

BEGIN
  a := 0;
  b := 1;

  FOR i := 1 TO n DO
    result := a + b;
    a := b;
    b := result;
  END_FOR;

  Fibonacci := result;
END_FUNCTION;

BEGIN
  n := 10;
  result := Fibonacci(n);
END_PROGRAM