// 5.36s
// 2
VAR
N : INT := 5;
K : INT := 3;
i : INT := 0;
END_VAR

PROGRAM main
VAR
tmpResult : INT;
END_VAR

tmpResult := 1;

FOR i := 0 TO K - 1 DO
IF i > 0 THEN
tmpResult := tmpResult * (N - i);
END_IF;
END_FOR;

WRITE("The binomial coefficient for N = " & INT_TO_STRING(N) & " and K = " & INT_TO_STRING(K) & " is: " & INT_TO_STRING(tmpResult));

END_PROGRAM