// 17.279552221298218s
// 4
```c
FUNCTION_BLOCK Fibonacci
VAR_INPUT
    n : UINT;
END_VAR
VAR_OUTPUT
    f : UINT;
END_VAR
f := 0;
IF n = 1 THEN
    f := 1;
ELSIF n > 1 THEN
    f := Fibonacci(n - 1) + Fibonacci(n - 2);
END_IF;
```