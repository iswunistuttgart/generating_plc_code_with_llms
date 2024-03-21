// 26.315582990646362s
// 1
// Declare the variables
var CONSTANT MAX_INDEX = 4;
var aWeights : array [0..MAX_INDEX] of int;
var iCnt : usint;
var sumWeight : double;
var avgWeight : int;

// Calculate the maximum index
maxIndex := MAX_INDEX;

// Initialize the weights array with zeros
for i in 0.. maxIndex loop
    aWeights[i] := 0;
end loop

// Set the counter to zero
iCnt := 0;

// Sum up all the weights
sumWeight := 0;
for i in 0.. maxIndex loop
    sumWeight := sumWeight + aWeights[i];
end loop

// Calculate the average weight
avgWeight := int(sumWeight / maxIndex);