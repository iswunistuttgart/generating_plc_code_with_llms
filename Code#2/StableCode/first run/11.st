// 12.2882559299469s
// 2

//IEC 61131-3 sign function
function sign(x) 
    VAR_INPUT
        y : INTEGER;
    END_VAR

    IF (x.GT. 0) THEN 
        y := 1; 
    ELSEIF (x.EQ. 0) THEN 
        y := 0; 
    ELSE 
        y := -1; 
    END IF 

    RETURN y;
END function