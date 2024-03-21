// 56.250558853149414s
// 2
```
PROGRAM PLC_Crane
VAR
    MAX_INDEX: USINT := 4;
END_VAR
VAR
    aWeights : ARRAY[0..MAX_INDEX] OF INT;
    iCnt : USINT;
    sumWeight : DINT;
    avgWeight : INT;
END_VAR
FUNCTION CalculateAverage(aWeights: ARRAY[0..MAX_INDEX] OF INT): INT
VAR
    iCnt : USINT;
    sumWeight : DINT;
    avgWeight : INT;
END_VAR
FOR iCnt := 0 TO MAX_INDEX DO
    aWeights[iCnt] := 10 * (iCnt + 1);
END_FOR
sumWeight := 0;
FOR iCnt := 0 TO MAX_INDEX DO
    sumWeight := sumWeight + aWeights[iCnt];
END_FOR
avgWeight := sumWeight / MAX_INDEX;
RETURN avgWeight;
END_FUNCTION
```