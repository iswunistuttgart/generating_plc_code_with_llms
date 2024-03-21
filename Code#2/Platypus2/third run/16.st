// 100.10831260681152s
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

    T1.INITIALIZE(0);
    T1.SET_PERIOD(10000);

    WHILE (T1.RUNNING) DO
        IF (T1.ELAPSED_TIME < 5000) THEN
            NORTH_GREEN := TRUE;
            EAST_RED := FALSE;
        ELSEIF (T1.ELAPSED_TIME >= 5000 AND T1.ELAPSED_TIME < 6000) THEN
            NORTH_YELLOW := TRUE;
            EAST_GREEN := FALSE;
        ELSEIF (T1.ELAPSED_TIME >= 9500 AND T1.ELAPSED_TIME < 10000) THEN
            EAST_YELLOW := TRUE;
            NORTH_RED := FALSE;
        END_IF;
    END_WHILE;
END_PROGRAM main