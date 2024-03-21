//30.69s
//2
PROGRAM SearchNumber
VAR
    RandomNumbers: ARRAY[1..100] OF INT; // Array containing 100 random numbers
    Found: BOOL; // TRUE if the number 10 is found, FALSE otherwise
    i: INT; // Index used for iterating through the list
END_VAR

i := 1; // Initialize index
Found := FALSE; // Initialize Found as FALSE

REPEAT
    IF RandomNumbers[i] = 10 THEN
        Found := TRUE; // Set Found to TRUE if number 10 is found
        EXIT; // Exit the loop if number 10 is found
    END_IF;
    i := i + 1; // Increment index
UNTIL i > 100; // Continue until the end of the list is reached

IF Found THEN
    // Number 10 was found in the list
    // Additional actions can be taken here if necessary
ELSE
    // Number 10 was not found in the list
    // Additional actions can be taken here if necessary
END_IF;

END_PROGRAM
