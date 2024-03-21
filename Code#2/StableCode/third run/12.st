// 10.001615762710571s
// 2

//IEC 61131-3 hyperbolic sine function
function SINH(X) 
    VAR
        Y : REAL;
    BEGIN
        Y = (exp(X) - exp(-X)) / 2;
    END
END