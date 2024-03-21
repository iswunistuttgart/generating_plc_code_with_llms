// 29.42s
// 2
VAR_INPUT
    X : REAL; // Input for the Lambert W function
END_VAR

VAR
    w : REAL := 0; // Initial guess for W(x)
    i : INT; // Counter for the loop
    we : REAL; // w * exp(w)
    w1e : REAL; // (w + 1) * exp(w)
    ewx : REAL; // exp(w) - x/w
    last : DWORD; // Last value of w for convergence check
END_VAR

// Iterative approximation using Newton's method
FOR i := 1 TO 100 DO // Limiting iterations to 100 for convergence
    we := w * EXP(w);
    w1e := (w + 1) * EXP(w);
    ewx := (we - X) / w1e;

    // Update w
    w := w - ewx;

    // Check for convergence
    IF DWORD(TO_REAL(w)) = last THEN
        EXIT; // Convergence achieved
    END_IF;
    last := DWORD(TO_REAL(w));
END_FOR;
