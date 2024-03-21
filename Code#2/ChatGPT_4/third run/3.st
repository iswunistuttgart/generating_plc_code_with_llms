// 21.82s
// 3
VAR_INPUT
    X : INT; // The position in the Fibonacci sequence
END_VAR

VAR
    t1 : DINT := 0; // First term
    t2 : DINT := 1; // Second term
    x_tmp : INT;
    i : INT;
    nextTerm : DINT;
END_VAR

IF X <= 0 THEN
    // Negative or zero index, not valid for Fibonacci sequence
    t1 := -1; // Indicate an error or invalid input
ELSIF X = 1 THEN
    t1 := 0; // First Fibonacci number is 0
ELSIF X = 2 THEN
    t1 := 1; // Second Fibonacci number is 1
ELSE
    FOR i := 3 TO X DO
        nextTerm := t1 + t2;
        t1 := t2;
        t2 := nextTerm;
    END_FOR
    t1 := nextTerm; // t1 now contains the Xth Fibonacci number
END_IF;
