//8.97s
//2
PROGRAM NumberSearch
VAR
    Numbers: ARRAY[1..100] OF INT;  // List of 100 random numbers
    NumberToFind: INT := 10;  // The number to find
    Found: BOOL := FALSE;  // Flag to indicate if the number is found
END_VAR

BEGIN
    // Initialize the list of 100 random numbers (simulated)
    FOR i := 1 TO 100 DO
        Numbers[i] := RANDOM(0, 100);  // Replace with actual random number generation
    END_FOR

    // Search for the number 10 in the list
    REPEAT
        FOR i := 1 TO 100 DO
            IF Numbers[i] = NumberToFind THEN
                Found := TRUE;
                EXIT;  // Abort the search if the number is found
            END_IF
        END_FOR
        EXIT;  // Abort the search if the end of the list is reached
    UNTIL FALSE;

    // Check if the number was found or not
    IF Found THEN
        // Number 10 was found in the list
        // Implement the necessary actions when the number is found
    ELSE
        // Number 10 was not found in the list
        // Implement the necessary actions when the number is not found
    END_IF
END_PROGRAM
