// 6.29s
// 2
VAR CONSTANT
    MAX_INDEX : USINT := 4;
END_VAR

VAR
    aWeights : ARRAY[0..MAX_INDEX] OF INT;
    iCnt : USINT;
    sumWeight : DINT;
    avgWeight : INT;
END_VAR

sumWeight := 0;

FOR iCnt := 0 TO MAX_INDEX DO
    sumWeight := sumWeight + aWeights[iCnt];
END_FOR;

avgWeight := sumWeight / (MAX_INDEX + 1);
