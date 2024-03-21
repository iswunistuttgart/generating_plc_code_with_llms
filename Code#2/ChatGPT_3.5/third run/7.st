// 7.3s
// 2
VAR CONSTANT
    MAX_INDEX: USINT := 4;
END_VAR

VAR
    aWeights : ARRAY[0..MAX_INDEX] OF INT;
    iCnt : USINT;
    sumWeight : DINT;
    avgWeight : INT;
END_VAR

// Initialize array with example values
aWeights := [10000, 8000, 12000, 6000, 9000];

// Calculate total load using a FOR loop
sumWeight := 0;
FOR iCnt := 0 TO MAX_INDEX DO
    sumWeight := sumWeight + aWeights[iCnt];
END_FOR

// Calculate average load
IF MAX_INDEX > 0 THEN
    avgWeight := sumWeight / (MAX_INDEX + 1);
ELSE
    avgWeight := 0;
END_IF
