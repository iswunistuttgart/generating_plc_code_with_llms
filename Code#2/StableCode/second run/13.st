// 24.00843334197998s
// 2

// Function to select a random number from the list
FUNCTION SelectRandomNumber()

    // Initialize variables
    VAR
        nIndex : INTEGER;
        nRandNum : INTEGER;
    END_VAR

    // Generate random numbers until abort condition is met
    WHILE (nCnt < CONSTANT.MAXNUMBERS)

        nIndex := CHR(ORD(CHR(INT((9 * RND()) + 1)))), 1);
        IF (aNumbers(nIndex, 1) = 0) THEN
            aNumbers(nIndex, 1) := nCnt;
            nRandNum := nIndex;
        END_IF

        INC(nCnt);
    END_WHILE

    // Return the number to be selected
    RETURN aNumbers(nRandNum, 2);
END_FUNCTION