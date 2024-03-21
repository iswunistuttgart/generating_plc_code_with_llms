// 84.533682346344s
// 2
PROGRAM Crane
    VAR
        CONSTANT
            MAX_INDEX : USINT := 4;
        aWeights : ARRAY[0..MAX_INDEX] OF INT;
        iCnt : USINT;
        sumWeight : DINT;
        avgWeight : INT;
    END_VAR
    PROCESS
        FOR iCnt := 0 TO MAX_INDEX - 1 DO
            aWeights[iCnt] := INPUT(0, iCnt);
        END_FOR
        sumWeight := SUM(aWeights);
        avgWeight := sumWeight / iCnt;
    END_PROCESS
END_PROGRAM