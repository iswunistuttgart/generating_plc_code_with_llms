// 82.44622421264648s
// 2 (VAR_END fehlt, RETURN falsch)
```c
FUNCTION W(z): LAMBERT_W;
VAR
    x, y, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12, z13, z14, z15: REAL;
BEGIN
    IF (z = 0) THEN
        RETURN 0;
    ELSEIF (z = -1) THEN
        RETURN -1;
    ELSEIF (z = 1) THEN
        RETURN 1;
    ELSEIF (z = 2) THEN
        RETURN 0.5772156649;
    ELSEIF (z = 3) THEN
        RETURN 0.8442236889;
    ELSEIF (z = 4) THEN
        RETURN 0.9615740451;
    ELSEIF (z = 5) THEN
        RETURN 0.9931285991;
    ELSEIF (z = 6) THEN
        RETURN 0.9987964478;
    ELSEIF (z = 7) THEN
        RETURN 0.9997660643;
    ELSEIF (z = 8) THEN
        RETURN 0.9999521683;
    ELSEIF (z = 9) THEN
        RETURN 0.9999951196;
    ELSEIF (z = 10) THEN
        RETURN 0.9999994756;
    ELSEIF (z = 11) THEN
        RETURN 0.9999999832;
    ELSEIF (z = 12) THEN
        RETURN 0.9999999983;
    ELSEIF (z = 13) THEN
        RETURN 0.9999999997;
    ELSEIF (z = 14) THEN
        RETURN 0.9999999999