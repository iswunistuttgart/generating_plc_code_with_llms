//27.0s
// 2
PROGRAM CraneLoadCalculation
    // Constants
    CONST
        NUM_RECEPTORS : INT := 5;
        MAX_ANALOG_VALUE : INT := 32767;
    END_CONST
    
    // Variable Declarations
    VAR
        aiLoadReceptors : ARRAY[1..NUM_RECEPTORS] OF INT; // Array of analog input values from load receptors
        nTotalLoad : INT; // Variable to hold the total load
        fAverageLoad : REAL; // Variable to hold the average load
    END_VAR

    // Initialize total load
    nTotalLoad := 0;

    // Calculate the total load using a FOR loop
    FOR i := 1 TO NUM_RECEPTORS DO
        nTotalLoad := nTotalLoad + aiLoadReceptors[i];
    END_FOR

    // Calculate the average load
    IF nTotalLoad > 0 THEN
        fAverageLoad := REAL(nTotalLoad) / NUM_RECEPTORS;
    ELSE
        fAverageLoad := 0.0;
    END_IF
END_PROGRAM
