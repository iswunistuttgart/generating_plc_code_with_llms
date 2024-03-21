//19.66s
//4
PROGRAM SignFunction
VAR
    x: REAL;        // Input variable
    signum: INT;    // Output variable (-1, 0, 1)
END_VAR

// Calculate the signum of the variable x
IF x < 0 THEN
    signum := -1;
ELSIF x > 0 THEN
    signum := 1;
ELSE
    signum := 0;
END_IF;

END_PROGRAM
