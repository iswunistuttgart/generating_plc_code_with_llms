VAR CONSTANT
    MAXNUMBERS : UINT := 99;
END_VAR

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
    nCnt : INT;
END_VAR

nCnt := 0;
REPEAT
    IF aNumbers[nCnt] = 10 THEN
    (*found the number 10*)
    EXIT;
    END_IF
    nCnt := nCnt + 1;
    UNTIL nCnt > MAXNUMBERS
END_REPEAT
