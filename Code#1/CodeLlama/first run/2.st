// 22.327478885650635s
// 2 (input falsch, Rückgabetyp gibt es nicht, RETURN falsch benutzt)
```c
FUNCTION COEF(N,K):BINOMIAL_COEFFICIENT
VAR
    I:UINT;
    J:UINT;
    RESULT:UINT;
END_VAR
RESULT := 1;
FOR I:=1 TO N DO
    FOR J:=1 TO K DO
        IF (J<=I) THEN
            RESULT := RESULT * (I-J+1)/J;
        END_IF;
    END_FOR;
END_FOR;
RETURN RESULT;
END_FUNCTION
```