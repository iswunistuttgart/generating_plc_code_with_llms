// 51.518468141555786s
// 2
IF I1 THEN
    IF I2 THEN
        WAIT TL
    ELSE
        Q1 := TRUE
    END_IF
ELSE
    IF I2 THEN
        WAIT TL
    ELSE
        Q2 := TRUE
    END_IF
END_IF