// 21.048837423324585s
// 1
// Declare the variables
var CONSTANT MAX_INDEX = 4;
var aWeights : array[0..<MAX_INDEX>];
var iCnt : usint;
var sumWeight : dint;
var avgWeight : int;

// Calculate the sum of weights
sumWeight := 0;
for (iCnt=0; iCnt<=MAX_INDEX-1; iCnt++) {
    sumWeight = sumWeight + aWeights[iCnt];
}

// Calculate the average weight
avgWeight := sumWeight/MAX_INDEX;