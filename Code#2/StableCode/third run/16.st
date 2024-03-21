// 22.658372163772583s
// 2
// Traffic Light Program in IEC 61131-3
// by J.K. Rowland

// Declare variables
VAR
    North_green : BOOL;
    North_yellow : BOOL;
    North_red : BOOL;
    East_green : BOOL;
    East_yellow : BOOL;
    East_red : BOOL;
    T1 : TON;
END_VAR

// Set up timer 1
T1.Init(10000);

// Traffic Light Control Structure
WHILE (T1.Read() > 0) DO
    IF North_green = TRUE THEN
        North_yellow = FALSE;
        North_red = FALSE;
    END IF;
    IF North_yellow = TRUE THEN
        North_red = FALSE;
    END IF;
    IF North_red = TRUE THEN
        East_green = FALSE;
        East_yellow = FALSE;
        East_red = FALSE;
    END IF;
    IF East_green = TRUE THEN
        East_yellow = FALSE;
        East_red = FALSE;
    END IF;
    IF East_yellow = TRUE THEN
        East_red = FALSE;
    END IF;
END WHILE;