// 25.48s
// 2
PROGRAM CraneLoadCalculation
VAR CONSTANT
    MAX_INDEX: USINT := 4; // Constant for the maximum index of the array
END_VAR
VAR
    aWeights : ARRAY[0..MAX_INDEX] OF INT; // Array for storing load receptor values
    iCnt : USINT; // Loop counter
    sumWeight : DINT; // Sum of weights
    avgWeight : INT; // Average weight
END_VAR

// Initialize sum
sumWeight := 0;

// Summing the weights using a FOR loop
FOR iCnt := 0 TO MAX_INDEX DO
    sumWeight := sumWeight + aWeights[iCnt];
END_FOR;

// Calculating the average weight
avgWeight := sumWeight DIV (MAX_INDEX + 1);

