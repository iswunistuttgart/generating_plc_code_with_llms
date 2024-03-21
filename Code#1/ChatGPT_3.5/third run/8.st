//11.22s
//2 eigentlich ausführbar, aber VAR an der falschen Stelle
PROGRAM LambertWApproximation
VAR_INPUT
    x: REAL; // Input value for the Lambert W function
END_VAR

VAR_OUTPUT
    LambertW: REAL; // Output value of the Lambert W function
END_VAR

VAR
    maxIterations: INT := 100;  // Maximum number of iterations
    tolerance: REAL := 1.0E-6; // Tolerance for convergence
    y, yPrev: REAL;
    i: INT;
END_VAR

METHOD LambertWApproximate
    IF x < -1.0 / exp(1.0) THEN
        // Handle the case where x is outside the domain of Lambert W
        LambertW := 0.0;
    ELSE
        // Initialize the approximate value
        y := MAX(x, -1.0 + tolerance);

        FOR i := 1 TO maxIterations DO
            yPrev := y;
            y := y - ((y * exp(y) - x) / (exp(y) + y * exp(y)));
            
            IF ABS(y - yPrev) < tolerance THEN
                // Convergence achieved
                LambertW := y;
                RETURN;
            END_IF
        END_FOR

        // If the loop completes without convergence, Lambert W is not valid
        LambertW := 0.0;
    END_IF
END_METHOD

END_PROGRAM
