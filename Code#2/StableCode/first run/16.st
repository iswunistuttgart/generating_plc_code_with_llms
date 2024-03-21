// 46.38920879364014s
// 2
// Declare variables
BOOL North_green = false;
BOOL North_yellow = false;
BOOL North_red = false;
BOOL East_green = false;
BOOL East_yellow = false;
BOOL East_red = false;
TON T1;

// Set timer
T1.setTimer(1000);

// Main loop
WHILE (T1.isTime()) DO
    IF North_green == true THEN
        North_yellow = false;
        North_red = false;
        East_green = false;
        East_yellow = false;
        East_red = false;
        North_green = false;
    END IF
    IF North_yellow == true THEN
        North_red = false;
        East_green = false;
        East_yellow = false;
        East_red = false;
        North_yellow = false;
    END IF
    IF North_red == true THEN
        North_green = false;
        East_green = false;
        East_yellow = false;
        East_red = false;
        North_red = false;
    END IF
    IF East_green == true THEN
        North_green = false;
        North_yellow = false;
        North_red = false;
        East_green = false;
        East_yellow = false;
        East_red = false;
    END IF
    IF East_yellow == true THEN
        North_green = false;
        North_yellow = false;
        North_red = false;
        East_green = false;
        East_yellow = false;
        East_red = false;
    END IF
    IF East_red == true THEN
        North_green = false;
        North_yellow = false;
        North_red = false;
        East_green = false;
        East_yellow = false;
        East_red = false;
    END IF
END WHILE