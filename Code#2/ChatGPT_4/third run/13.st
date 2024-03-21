// 20.39s
// 2
VAR CONSTANT
    MAXNUMBERS : UINT := 99; // Index goes from 0 to 99 for 100 numbers
END_VAR

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT; // Array of 100 random numbers
    nCnt : INT := 0; // Counter for the loop
END_VAR

// Initialize nCnt
nCnt := 0;

// Repeat loop to search through the array
REPEAT
    // Check if current number is 10
    IF aNumbers[nCnt] = 10 THEN
        EXIT; // Exit the loop if number is found
    END_IF;
    
    // Increment the counter
    nCnt := nCnt + 1;
UNTIL nCnt > MAXNUMBERS; // Continue until the end of the array is reached
