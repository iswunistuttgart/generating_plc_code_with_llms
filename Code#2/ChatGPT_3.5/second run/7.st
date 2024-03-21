// 5.63s
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

sumWeight := 0;

FOR iCnt := 0 TO MAX_INDEX DO
    // Read individual loads from analog inputs (replace with actual input values)
    aWeights[iCnt] := ...;
    sumWeight := sumWeight + aWeights[iCnt];
END_FOR

// Calculate average weight
IF MAX_INDEX > 0 THEN
    avgWeight := sumWeight / (MAX_INDEX + 1);
ELSE
    avgWeight := 0; // To avoid division by zero
END_IF
