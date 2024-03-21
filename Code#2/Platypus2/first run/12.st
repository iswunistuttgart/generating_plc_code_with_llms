// 64.78193426132202s
// 2
FUNCTION sinehyp(X)
    IF (X < 0.0) THEN
        RETURN -sinehyp(-X);
    END_IF
    IF (X > 1.0) THEN
        RETURN 1.0;
    END_IF
    IF (X == 0.0) THEN
        RETURN 0.0;
    END_IF
    IF (X < 1.0) THEN
        RETURN SQRT(2.0)*EXP(-X*X);
    ELSE
        RETURN EXP(X)-EXP(-X);
    END_IF
END_FUNCTION