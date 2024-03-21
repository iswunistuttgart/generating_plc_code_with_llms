// 6.65s
// 2
VAR CONSTANT
  MAX_INDEX: USINT := 4;
END_VAR
VAR
  aWeights : ARRAY[0..MAX_INDEX] OF INT;
  iCnt : USINT;
  sumWeight : DINT := 0;
  avgWeight : INT;
END_VAR

PROGRAM main

FOR iCnt := 0 TO MAX_INDEX DO
  aWeights[iCnt] := 0;
  sumWeight := sumWeight + aWeights[iCnt];
END_FOR;

avgWeight := sumWeight / MAX_INDEX;

WRITE("Total Weight: " & INT_TO_STRING(sumWeight));
WRITE("Average Weight: " & INT_TO_STRING(avgWeight));

END_PROGRAM