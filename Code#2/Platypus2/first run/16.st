// 162.15188837051392s
// 2
PROGRAM main
    VAR
        North_green : BOOL;
        North_yellow : BOOL;
        North_red : BOOL;
        East_green : BOOL;
        East_yellow : BOOL;
        East_red : BOOL;
        T1 : TON;
    END_VAR

    NORTH_GREEN := TRUE;
    EAST_RED := FALSE;

    T1.INITIALIZE(10000);
    T1.START();

    WHILE (T1.RUNNING) DO
        IF (T1.ELAPSED() < 5000) THEN
            NORTH_GREEN := TRUE;
            EAST_RED := FALSE;
        ELSEIF (T1.ELAPSED() >= 5000 AND T1.ELAPSED() <= 9500) THEN
            NORTH_YELLOW := TRUE;
            EAST_GREEN := TRUE;
        ELSEIF (T1.ELAPSED() > 9500 AND T1.ELAPSED() < 10000) THEN
            NORTH_RED := TRUE;
            EAST_YELLOW := TRUE;
        END_IF;
    END_WHILE;
END_PROGRAM main