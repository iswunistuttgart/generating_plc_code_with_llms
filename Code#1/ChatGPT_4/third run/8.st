//32.73s
//2
FUNCTION LambertW : REAL
VAR_INPUT
    x : REAL; // Input value for which to compute W(x)
END_VAR
VAR
    w : REAL := 0; // Initial guess for W(x)
    tol : REAL := 1e-5; // Tolerance for stopping the iteration
    maxIter : INT := 100; // Maximum number of iterations
    iter : INT := 0; // Iteration counter
    diff : REAL; // Difference between successive iterations
END_VAR

// Check for the special case of x = 0
IF x = 0 THEN
    RETURN 0;
END_IF

// Check for a reasonable starting point for x > e or x < -1/e
IF x > 2.71828 OR x < -0.367879 THEN
    w := x;
ELSE
    w := LOG(x); // Start with natural logarithm of x for better convergence if x is within a typical range
END_IF

// Newton-Raphson iteration for the Lambert W function
REPEAT
    diff := (w * EXP(w) - x) / (EXP(w) + w * EXP(w));
    w := w - diff;
    iter := iter + 1;
UNTIL (ABS(diff) < tol) OR (iter >= maxIter);

// Check for non-convergence
IF iter >= maxIter THEN
    w := -1; // An error value to indicate non-convergence
END_IF

RETURN w;
END_FUNCTION
