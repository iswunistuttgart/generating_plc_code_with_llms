//36.73s
//2
PROGRAM LambertWFunction
VAR
    x: REAL; // The input value for which you want to find the Lambert W
    w: REAL; // The approximation of the Lambert W function result
    w_prev: REAL; // The previous approximation of W to check for convergence
    e_to_w: REAL; // e raised to the power of the current approximation of W
    tolerance: REAL := 1e-5; // Tolerance for the approximation
    max_iterations: INT := 100; // Maximum number of iterations
    iteration: INT; // Current iteration counter
END_VAR

// Initial guess, works well for small x values
IF x < 1 THEN
    w := x;
ELSE
    w := LOG(x); // Natural logarithm of x as the initial guess for larger values
END_IF

iteration := 0;
REPEAT
    iteration := iteration + 1;
    e_to_w := EXP(w); // e raised to the current approximation of W
    w_prev := w;
    // Halley's method for next approximation
    w := w - ((w * e_to_w - x) / (e_to_w * (w + 1) - ((w + 2) * (w * e_to_w - x) / (2 * w + 2))));
UNTIL (ABS(w - w_prev) <= tolerance) OR (iteration >= max_iterations);

// The result is in w
END_PROGRAM
