//8.86s
//2
(* Program to calculate the binomial coefficient *)

VAR
  n: INT; (* Number of items *)
  k: INT; (* Number of choices *)
  result: INT; (* Binomial coefficient *)

(* Main program *)
PROGRAM Main
BEGIN
  n := 10;
  k := 2;
  result := BinomialCoefficient(n, k);
  WRITE('The binomial coefficient of', n, 'choose', k, 'is', result);
END_PROGRAM

(* Function to calculate the binomial coefficient *)
FUNCTION BinomialCoefficient(n: INT; k: INT): INT
VAR
  i: INT;
  temp: INT;
BEGIN
  IF k > n THEN
    RETURN(0);
  END_IF;
  IF k = 0 OR k = n THEN
    RETURN(1);
  END_IF;
  temp := 1;
  FOR i := 1 TO k DO
    temp := temp * (n - i + 1);
    temp := temp / i;
  END_FOR;
  RETURN(temp);
END_FUNCTION