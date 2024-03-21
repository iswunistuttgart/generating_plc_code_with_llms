// 26.82681369781494s
// 1
Function FC1003() : VOID 
{ 
    VAR_INPUT ; 
    IN_R = REAL(IN_MAX,IN_MIN); 
    IF (IN_R > IN_MAX) THEN 
        IN_R = IN_MAX; 
    END IF; 
    IF (IN_R < IN_MIN) THEN 
        IN_R = IN_MIN; 
    END IF; 
    OUT_R = REAL(OUT_MAX,OUT_MIN); 
    IF (DIFF1 = 0.0) THEN 
        FEH = TRUE; 
    ELSE
        FEH = FALSE; 
    END IF; 
    IF (DIFF2 = 0.0) THEN 
        OUT_R = -20.0; 
    ELSE
        OUT_R = 40.0; 
    END IF; 
END Function