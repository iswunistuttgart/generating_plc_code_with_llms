// 18.57s
// 2
PROGRAM NumberSearch
VAR CONSTANT
    MAXNUMBERS : UINT := 99;
END_VAR

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT; // Array of 100 random numbers
    nCnt : INT; // Counter variable
    found : BOOL; // Flag to indicate if number 10 is found
END_VAR

nCnt := 0; // Initialize counter
found := FALSE; // Initialize found flag

// Start of the repeat loop
REPEAT
    IF aNumbers[nCnt] = 10 THEN
        found := TRUE; // Set found to TRUE if number 10 is found
        EXIT; // Exit the loop
    END_IF
    nCnt := nCnt + 1; // Increment the counter
UNTIL nCnt > MAXNUMBERS; // Loop until the end of the array
