// 21.906404733657837s
// 2 (VAR_END fehlt, RETURN falsch, input variable falsch)
```
FUNCTION SelectNumber(VAR Numbers: ARRAY [0..99] OF INTEGER): INTEGER;
    VAR
        i: INTEGER;
    BEGIN
        REPEAT
            i := RANDOM(100);
            IF Numbers[i] = 10 THEN EXIT;
        UNTIL Numbers[i] <> 10;
        RETURN Numbers[i];
    END SelectNumber;
```