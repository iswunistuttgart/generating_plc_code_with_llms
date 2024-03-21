// 58.20185971260071s
// 2
PROGRAM Crane;
VAR
    Load1 : INTEGER;
    Load2 : INTEGER;
    Load3 : INTEGER;
    Load4 : INTEGER;
    Load5 : INTEGER;
    TotalLoad : INTEGER;
    AverageValue : REAL;
END_VAR;

FOR i := 1 TO 5 DO
    Load[i] := ANALOG(i);
ENDFOR;
TotalLoad := SUM(Load[*]);
AverageValue := TotalLoad / 5.0;