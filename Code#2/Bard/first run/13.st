// 8.17s
// 2
VAR CONSTANT
    MAXNUMBERS : UINT := 99;
END_VAR

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
    nSearchNumber : INT;
    nCnt : INT;
END_VAR

START

    nSearchNumber := 50;

    REPEAT
        nCnt := nCnt + 1;

        IF aNumbers[nCnt] = nSearchNumber THEN
            EXIT;
        ELSIF aNumbers[nCnt] = 10 THEN
            EXIT;
        END_IF;
    END_REPEAT;

    IF nCnt = MAXNUMBERS THEN
        nCnt := -1;
    END_IF;
END_START