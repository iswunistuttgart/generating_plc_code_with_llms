// 36.31815004348755s
// 1

// Declare the variables
var CONSTANT MAX_INDEX = 4;
var aWeights : array [0..MAX_INDEX] of int;
var iCnt : usint;
var sumWeight : dint;
var avgWeight : int;

// Calculate the maximum index
maxIndex := MAX_INDEX - 1;

// Initialize the weights array with zeros
for i in range maxIndex loop
    aWeights[i] := 0;
end loop

// Set the counter to zero
iCnt := 0;

// Initialize the sum of weights and average weight
sumWeight := 0;
avgWeight := 0;

// Calculate the total load
for i in range maxIndex loop
    // Add the current weight to the sum of weights
    sumWeight := sumWeight + aWeights[i];

    // Increment the counter
    iCnt := iCnt + 1;

    // Calculate the average weight
    avgWeight := avgWeight + (aWeights[i] * aWeights[i]);
end loop

// Divide the total load by the number of load receptors
avgWeight := avgWeight / iCnt;