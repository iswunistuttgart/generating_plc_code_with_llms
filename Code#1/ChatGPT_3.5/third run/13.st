//8.89s
//2; wenn VAR richtig, immernoch falsch
PROGRAM NumberSearch
VAR
    NumberList: ARRAY[1..100] OF INT;  // List of 100 random numbers
    FoundTen: BOOL := FALSE;  // Flag to indicate if the number 10 is found
    i: INT := 1;  // Loop variable
END_VAR

METHOD SearchNumber
    REPEAT
        IF NumberList[i] = 10 THEN
            FoundTen := TRUE;  // Number 10 is found, abort the search
            EXIT;
        END_IF
        i := i + 1;  // Move to the next number in the list

        IF i > 100 THEN
            EXIT;  // All elements have been checked, abort the search
        END_IF
    UNTIL FoundTen OR i > 100;
END_METHOD

END_PROGRAM
