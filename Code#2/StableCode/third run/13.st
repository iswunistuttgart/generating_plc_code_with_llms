// 21.416545152664185s
// 2

// Function to select a random number from the list
FUNCTION SelectRandomNumber()

    // Initialize variables
    VAR
        nIndex : INTEGER;
        nRandNum : INTEGER;
    END_VAR

    // Generate random number between 0 and MAXNUMBERS
    nIndex = CONSTANT.MAXNUMBERS;
    WHILE (nIndex > 0) DO
        SET nIndex := nIndex - 1;
        nRandNum := CONSTANT.aNumbers[nIndex] MOD 256;
    END_WHILE

    // Check if the number 10 is found
    IF (nRandNum = 10) THEN
        ABORT;
    END_IF

    RETURN nRandNum;
END