// 32.68471574783325s
// 2 (i ist nicht definiert)
```
PROGRAM Crane;
VAR
  LoadReceptors : ARRAY [1..5] OF INTEGER := (0, 0, 0, 0, 0);
  TotalLoad : INTEGER;
  AverageValue : REAL;
END_VAR;

FOR i := 1 TO 5 DO
  LoadReceptors[i] := AnalogInput(i);
END_FOR;

TotalLoad := 0;
FOR i := 1 TO 5 DO
  TotalLoad := TotalLoad + LoadReceptors[i];
END_FOR;
AverageValue := TotalLoad / 5.0;
```