// 62.37231373786926s
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
FUNCTION GetWeight(iIndex: USINT) : INT
VAR
    iWeight : INT;
END_VAR
iWeight := aWeights[iIndex];
RETURN iWeight;
END_FUNCTION
PROGRAM
aWeights[0] := 12345;
aWeights[1] := 23456;
aWeights[2] := 34567;
aWeights[3] := 45678;
iCnt := 0;
sumWeight := 0;
WHILE iCnt < MAX_INDEX DO
    sumWeight := sumWeight + GetWeight(iCnt);
    iCnt := iCnt + 1;
END_WHILE
avgWeight := sumWeight / MAX_INDEX;
ENDPROGRAM
```