// 26.03848958015442s
// 2 (Timer nicht richtig deklariert/initialisiert)
```
PROGRAM Interlock_Example;
VAR
  I1, I2 : BOOL;
  Q1, Q2 : BOOL;
  TL : TIME := 50ms;
END_VAR;

IF (I1 AND NOT(Q1)) OR (I2 AND NOT(Q2)) THEN
  IF (I1 AND NOT(Q1)) THEN
    Q1 := TRUE;
    Q2 := FALSE;
  ELSE
    Q2 := TRUE;
    Q1 := FALSE;
  END_IF;
END_IF;
```