// 17.66s
// 2
VAR CONSTANT
    MAX_INDEX: USINT := 4; // 5 load receptors, indexed 0 to 4
END_VAR

VAR
    aWeights : ARRAY[0..MAX_INDEX] OF INT; // Array of weights from load receptors
    iCnt : USINT; // Counter for the loop
    sumWeight : DINT := 0; // Sum of weights
    avgWeight : INT; // Average weight
END_VAR

// Reset sumWeight
sumWeight := 0;

// Calculate the total weight
FOR iCnt := 0 TO MAX_INDEX DO
    sumWeight := sumWeight + aWeights[iCnt];
END_FOR;

// Calculate the average weight
avgWeight := INT(sumWeight / (MAX_INDEX + 1)); // Adding 1 since index starts from 0
