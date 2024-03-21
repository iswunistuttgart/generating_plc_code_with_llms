//9.64
//2 wenn Var richtig, dann 4
PROGRAM CraneControl
VAR_INPUT
    LoadReceptor: ARRAY[1..5] OF INT := [0, 0, 0, 0, 0]; // Input load values from 0 to 32767
END_VAR

VAR_OUTPUT
    TotalLoad: INT := 0;  // Output for total load
    AverageLoad: INT := 0;  // Output for average load
END_VAR

VAR
    NumLoadReceptors: INT := 5;  // Number of load receptors
    i: INT;  // Loop variable
    LoadSum: INT := 0;  // Total load accumulator
END_VAR

METHOD CalculateLoad
    LoadSum := 0;

    FOR i := 1 TO NumLoadReceptors DO
        LoadSum := LoadSum + LoadReceptor[i];
    END_FOR

    IF NumLoadReceptors > 0 THEN
        AverageLoad := LoadSum / NumLoadReceptors;
    ELSE
        AverageLoad := 0; // Avoid division by zero
    END_IF

    TotalLoad := LoadSum;
END_METHOD

END_PROGRAM
