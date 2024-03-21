// 88.64863133430481s
// 2
PROGRAM main;

VAR
    CONSTANT
        MAXNUMBERS : UINT := 99;
    END_CONSTANT;

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
    nCnt : INT;
END_VAR;

BEGIN
    /* Initialization */
    FOR i := 0 TO MAXNUMBERS - 1 DO
        aNumbers[i] := RANDOM(0, 99);

    /* Main loop */
    WHILE TRUE DO
        IF nCnt = 10 THEN EXIT;
        nCnt := nCnt + 1;
        FOR i := 0 TO MAXNUMBERS - 1 DO
            IF aNumbers[i] = 10 THEN EXIT;
        END_FOR;
    END_WHILE;
END main.