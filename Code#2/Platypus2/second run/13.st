// 74.85572910308838s
// 2
PROGRAM main;

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
    nCnt : INT;
    i : INT;
    s : STRING(10);
END_VAR

BEGIN
    FOR i := 0 TO MAXNUMBERS DO
        aNumbers[i] := RANDOM(0, 99);
    nCnt := 0;
    WHILE (nCnt < 10) AND (aNumbers[nCnt] <> 10) DO
        INCREMENT nCnt;
    IF aNumbers[nCnt] = 10 THEN
        EXIT;
END_PROGRAM