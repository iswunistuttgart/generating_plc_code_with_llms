// 116.2343533039093s
// 2
PROGRAM main;

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
    nCnt : INT;
    i : INT;
    s : STRING(10);
END_VAR

BEGIN
    CLEAR_SCREEN;
    PRINT('Enter the number of random numbers:');
    READLN(nCnt);
    FOR i := 0 TO nCnt - 1 DO
        aNumbers[i] := RANDOM(0, 99);
    END_FOR;
    PRINT('The list contains the following numbers:');
    FOR i := 0 TO nCnt - 1 DO
        PRINT(aNumbers[i], ' ');
    END_FOR;
    REPEAT
        PRINT('Enter a number to search for:');
        READLN(s);
        IF s = '10' THEN
            EXIT;
        END_IF;
        FOR i := 0 TO nCnt - 1 DO
            IF aNumbers[i] = INT(s) THEN
                EXIT;
            END_IF;
        END_FOR;
    UNTIL FALSE;
    PRINT('The number was not found.');
END main.