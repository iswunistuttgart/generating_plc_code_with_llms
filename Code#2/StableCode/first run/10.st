// 11.58929181098938s
// 2

//IEC 61131-3:2004(E) p. 87

FUNCTION sigmoid FUNCTION_NAME() : REAL
    VAR_INPUT
        X : REAL = <input>;
    END_VAR

    RETURN (2 / (1 + exp(-X))) - 1;
END_FUNCTION