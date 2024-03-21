// 7.42s
// 2
VAR CONSTANT
    MAXNUMBERS : UINT := 99;
END_VAR

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
    nCnt : INT;
END_VAR

// Initialize the array with random numbers (replace this with your logic)
FOR nCnt := 0 TO MAXNUMBERS DO
    aNumbers[nCnt] := SOME_RANDOM_NUMBER_FUNCTION();
END_FOR

// Search for the specific number (10) in the list
nCnt := 0;

REPEAT
    IF aNumbers[nCnt] = 10 THEN
        // Abort the search if the number 10 is found
        EXIT;
    END_IF

    nCnt := nCnt + 1;
UNTIL nCnt > MAXNUMBERS;

// Check if the number 10 was found or not
IF nCnt <= MAXNUMBERS THEN
    // Number 10 was found
    // Your logic for when the number is found
ELSE
    // Number 10 was not found
    // Your logic for when the number is not found
END_IF
