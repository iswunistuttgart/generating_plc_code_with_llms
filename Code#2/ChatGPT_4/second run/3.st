// 17.02s
// 3
VAR_INPUT
    X : INT;
END_VAR

VAR
    t1 : DINT := 0;
    t2 : DINT := 1;
    nextTerm : DINT := 0;
    i : INT;
END_VAR

IF X = 0 THEN
    nextTerm := 0;
ELSIF X = 1 THEN
    nextTerm := 1;
ELSE
    FOR i := 2 TO X DO
        nextTerm := t1 + t2;
        t1 := t2;
        t2 := nextTerm;
    END_FOR;
END_IF;
