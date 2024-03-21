//20.48s
//2
FUNCTION Fibonacci : DINT
VAR_INPUT
    n : DINT; (* The index n for which the Fibonacci number is calculated *)
END_VAR
VAR
    a : DINT := 0;
    b : DINT := 1;
    temp : DINT;
    i : DINT;
END_VAR

IF n = 0 THEN
    RETURN 0;
ELSIF n = 1 THEN
    RETURN 1;
END_IF

FOR i := 2 TO n DO
    temp := a + b;
    a := b;
    b := temp;
END_FOR

Fibonacci := b;
END_FUNCTION
