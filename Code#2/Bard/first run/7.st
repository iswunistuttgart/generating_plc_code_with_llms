// 7.63s
// 2
VAR CONSTANT
    MAX_INDEX: USINT := 4;
END_VAR
VAR
    aWeights: ARRAY[0..MAX_INDEX] OF INT;
    iCnt: USINT;
    sumWeight: DINT := 0;
    avgWeight: INT;
END_VAR

START

    FOR iCnt := 0 TO MAX_INDEX DO
        READ_ANALOG aWeights[iCnt];
        sumWeight := sumWeight + aWeights[iCnt];
    END_FOR;

    avgWeight := sumWeight / MAX_INDEX;
    WRITE_ANALOG avgWeight;

END_START