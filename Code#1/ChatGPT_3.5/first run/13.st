//12.85s
//2
PROGRAM NumberSearch
VAR
    NumberList: ARRAY[1..100] OF INT;  // Array of 100 random numbers
    NumberToFind: INT := 10;           // Number to search for
    NumberFound: BOOL := FALSE;        // Flag to indicate if the number is found
    i: INT := 1;                       // Loop counter
END_VAR

FOR i := 1 TO 100 DO
    NumberList[i] := RANDOM(1, 100);  // Replace with a function that generates random numbers

    IF NumberList[i] = NumberToFind THEN
        NumberFound := TRUE;  // The number 10 is found, abort the search
        EXIT;  // Exit the loop
    END_IF
END_FOR

IF NOT NumberFound THEN
    // The number 10 was not found in the list
    // Handle the case where the number does not exist
    // Your logic for this case goes here
END_IF

// Your program logic continues here
