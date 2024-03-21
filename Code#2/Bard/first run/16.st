// 8.59s
// 2
VAR
  North_green : BOOL;
  North_yellow : BOOL;
  North_red : BOOL;
  East_green : BOOL;
  East_yellow : BOOL;
  East_red : BOOL;
  T1 : TON;
END_VAR

START

  T1 := 0;

  North_green := TRUE;
  North_yellow := FALSE;
  North_red := FALSE;
  East_green := FALSE;
  East_yellow := FALSE;
  East_red := TRUE;

  WHILE T1 < 5000 DO

    IF T1 >= 4500 THEN
      North_green := FALSE;
      North_yellow := TRUE;
    END_IF;

    IF T1 >= 5500 THEN
      North_yellow := FALSE;
      North_red := TRUE;
      East_green := TRUE;
      East_red := FALSE;
    END_IF;

    IF T1 >= 9500 THEN
      East_green := FALSE;
      East_yellow := TRUE;
    END_IF;

    IF T1 >= 10000 THEN
      East_yellow := FALSE;
      East_red := TRUE;
    END_IF;

    END_WHILE;

END_START