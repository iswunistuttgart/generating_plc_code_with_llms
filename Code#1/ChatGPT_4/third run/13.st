//35.67s
//2
PROGRAM SearchNumber
VAR
    NumberList : ARRAY[1..100] OF INT; // List of random numbers
    i : INT := 1; // Loop counter starts at 1
    Found : BOOL := FALSE; // Flag to indicate if the number is found
    NumberToFind : INT := 10; // Number to find in the list
END_VAR

// Populate NumberList with random numbers for this example
// In a real-world scenario, this list would be populated differently
NumberList := [23, 56, 4, 67, 10, 1, 45, ... , 89]; // Continue filling the array with random numbers

// Search for the specific number
REPEAT
    IF NumberList[i] = NumberToFind THEN
        Found := TRUE;
        EXIT; // Exit the loop if the number is found
    END_IF

    i := i + 1;
UNTIL i > 100 OR Found;

// After the loop, check if the number was found
IF Found THEN
    // Code to handle the number found case
    // ...
ELSE
    // Code to handle the number not found case
    // ...
END_IF

END_PROGRAM
