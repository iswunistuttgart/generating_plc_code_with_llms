//30.22s
//2
(* Function to calculate factorial *)
FUNCTION Factorial : LINT
VAR_INPUT
    n : UINT; (* non-negative integer *)
END_VAR
VAR
    result : LINT := 1; (* Initialize result to 1 *)
    i : UINT;
END_VAR

FOR i := 1 TO n DO
    result := result * LINT#(i);
END_FOR

Factorial := result;
END_FUNCTION

(* Function to calculate binomial coefficient *)
FUNCTION BinomialCoefficient : LINT
VAR_INPUT
    n : UINT; (* n in n choose k *)
    k : UINT; (* k in n choose k *)
END_VAR

IF k > n THEN
    RETURN 0; (* If k > n, then the coefficient is 0 *)
END_IF

BinomialCoefficient := Factorial(n) / (Factorial(k) * Factorial(n - k));
END_FUNCTION
