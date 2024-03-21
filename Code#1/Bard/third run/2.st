//4.63s
//2
PROGRAM BinomialCoefficient

VAR
  n: INT;
  k: INT;
  result: INT;

BEGIN

  IF k > n OR k < 0 THEN
    result := 0;
  ELSIF k = 0 OR k = n THEN
    result := 1;
  ELSE
    result := BinomialCoefficient(n - 1, k - 1) + BinomialCoefficient(n - 1, k);
  END_IF;
END_PROGRAM