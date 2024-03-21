// 33.6s
// 2
PROGRAM LambertWFunction
VAR_INPUT
    X : REAL; // Input for Lambert W function
END_VAR
VAR
    w : REAL; // Approximation of W(x)
    i : INT; // Loop counter
    we : REAL; // w * e^w
    w1e : REAL; // (w+1) * e^w
    ewx : REAL; // e^w - x
    last : DWORD; // Last value for comparison
END_VAR

// Initialize variables
w := 0; // Initial guess
last := 0;

// Iterative calculation
FOR i := 0 TO 100 DO // Limit iterations to prevent infinite loop
    we := w * EXP(w);
    w1e := (w + 1) * EXP(w);
    ewx := we - X;
    w := w - ewx / w1e; // Newton's method formula

    // Break if there is no significant change
    IF DWORD(ABS(w)) = last THEN
        EXIT;
    END_IF
    last := DWORD(ABS(w));
END_FOR;

