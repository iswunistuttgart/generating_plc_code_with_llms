// 20.21s
// 2
VAR CONSTANT
    MAXNUMBERS : UINT := 99;  (* The upper index of the array *)
END_VAR

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT;  (* Array of 100 random numbers *)
    nCnt : INT;                              (* Counter for the loop *)
END_VAR

nCnt := 0;

REPEAT
    IF aNumbers[nCnt] = 10 THEN
        EXIT;  (* Exit the loop if the number 10 is found *)
    END_IF;

    nCnt := nCnt + 1;
UNTIL nCnt > MAXNUMBERS;  (* Continue until the end of the array is reached *)
