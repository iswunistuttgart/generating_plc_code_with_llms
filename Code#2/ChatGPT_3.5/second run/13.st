// 5.81s
// 2
VAR CONSTANT
    MAXNUMBERS : UINT := 99;
END_VAR

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
    nCnt : INT;
END_VAR

nCnt := 0;

REPEAT
    // Check if the current number is 10
    IF aNumbers[nCnt] = 10 THEN
        // Abort the search if 10 is found
        EXIT;
    END_IF;

    // Increment the counter
    nCnt := nCnt + 1;

    // Check if the end of the list is reached
    IF nCnt > MAXNUMBERS THEN
        // Abort if the end of the list is reached without finding 10
        EXIT;
    END_IF;
UNTIL FALSE;
