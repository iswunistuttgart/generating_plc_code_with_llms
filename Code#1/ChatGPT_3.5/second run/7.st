//10.15s
//2
PROGRAM CraneLoadCalculation
VAR
    LoadReceptorValues: ARRAY[1..5] OF INT;  // Load receptor values (0 - 32767)
    TotalLoad: REAL := 0.0;  // Total load variable
    AverageLoad: REAL := 0.0;  // Average load variable
    NumLoadReceptors: INT := 5;  // Number of load receptors (constant)
END_VAR

VAR CONSTANT
    LoadValueMax: INT := 32767;  // Maximum load value (constant)
END_VAR

VAR CONSTANT
    TotalLoadDivider: INT := 1000;  // Constant used for calculating average load
END_VAR

BEGIN
    // Simulate reading values from the load receptors
    // In practice, you would read the actual analog input values here
    LoadReceptorValues[1] := 15000;
    LoadReceptorValues[2] := 20000;
    LoadReceptorValues[3] := 25000;
    LoadReceptorValues[4] := 28000;
    LoadReceptorValues[5] := 32000;

    // Calculate the total load using a FOR loop
    FOR i := 1 TO NumLoadReceptors DO
        TotalLoad := TotalLoad + REAL(LoadReceptorValues[i]);
    END_FOR

    // Calculate the average load
    IF NumLoadReceptors > 0 THEN
        AverageLoad := TotalLoad / (NumLoadReceptors * TotalLoadDivider);
    ELSE
        AverageLoad := 0.0;
    END_IF
END_PROGRAM
