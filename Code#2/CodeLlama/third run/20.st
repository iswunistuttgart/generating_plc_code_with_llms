// 82.86100125312805s
// 2
```
FUNCTION_BLOCK INTERLOCK
VAR_INPUT
    I1 : BOOL;
    I2 : BOOL;
    TL : TIME;
END_VAR
VAR_OUTPUT
    Q1 : BOOL;
    Q2 : BOOL;
END_VAR
VAR
    T1 : TOF;
    T2 : TOF;
END_VAR

PROGRAM INTERLOCK
VAR
    I1 : BOOL := FALSE;
    I2 : BOOL := FALSE;
    TL : TIME := '0:0:0.5';
    Q1 : BOOL;
    Q2 : BOOL;
END_VAR

IF (I1) THEN
    IF (NOT(T1)) THEN
        Q1 := TRUE;
        T1 := TOF;
    END_IF;
ELSIF (I2) THEN
    IF (NOT(T2)) THEN
        Q2 := TRUE;
        T2 := TOF;
    END_IF;
END_IF;

IF (Q1 AND NOT(Q2)) OR (Q2 AND NOT(Q1)) THEN
    IF ((I1 AND NOT(T1)) OR (I2 AND NOT(T2))) THEN
        Q1 := TRUE;
        T1 := TOF;
    END_IF;
ELSE
    Q1 := FALSE;
END_IF;

IF (Q2 AND NOT(Q1)) THEN
    IF ((I1 AND NOT(T1)) OR (I2 AND NOT(T2))) THEN
        Q2 := TRUE;
        T2 := TOF;
    END_IF;
ELSE
    Q2 := FALSE;
END_IF;

END_PROGRAM
```