//5.38s
//2
PROGRAM BinomialCoefficient
VAR
  n: INT;
  k: INT;
  result: INT;
FUNCTION BinomialCoefficient(n: INT; k: INT): INT
VAR
  i: INT;
  temp: INT;
BEGIN
  result := 1;
  FOR i := 1 TO k DO
    temp := n - i + 1;
    IF temp < i THEN
      temp := i;
    END_IF;
    result := result * temp / i;
  END_FOR;
  BinomialCoefficient := result;
END_FUNCTION
END_PROGRAM
