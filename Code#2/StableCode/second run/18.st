// 11.579832553863525s
// 1
Function FC1003() : VOID 
{ 
    VAR_INPUT(); 
    IN_R = REAL(IN_MAX, IN_MIN); 
    OUT_R = REAL(OUT_MAX, OUT_MIN); 
    RETURN; 
} 

Function FC1003() : REAL 
{ 
    VAR_OUTPUT(); 
    FEH = BOOL(DIFF2 > 40 || DIFF2 < -40);
    OUT_R = (FEH)? IN_R : REAL(OUT_MAX, OUT_MIN);
    RETURN FEH; 
}