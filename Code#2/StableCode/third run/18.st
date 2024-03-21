// 9.908924341201782s
// 1
Function FC1003() : VOID 
{ 
    VAR_INPUT(); 
    IF (IN_R > IN_MAX) THEN 
        OUT_R = IN_MIN ; 
        FEH = TRUE ; 
    ELSEIF (IN_R < IN_MIN) THEN 
        OUT_R = IN_MAX ; 
        FEH = TRUE ; 
    ELSE
        FEH = FALSE; 
        OUT_R = 0.5 * (DIFF1 + DIFF2);
    END IF ; 
    VAR_OUTPUT(); 
}