// 41.79835319519043s
// 2
```
FUNCTION SelectNumber(nNumber : INT) : BOOL;
VAR
    bFound : BOOL := FALSE;
END_VAR

bFound := FALSE;
REPEAT
    IF aNumbers[nCnt] = nNumber THEN
        bFound := TRUE;
        EXIT;
    END_IF;
    nCnt := nCnt + 1;
UNTIL (nCnt > MAXNUMBERS) OR (bFound);

IF NOT(bFound) AND (aNumbers[nCnt] = 10) THEN
    EXIT;
END_IF;

RETURN bFound;
END_FUNCTION;
```