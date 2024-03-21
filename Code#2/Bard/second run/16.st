// 6.98s
// 2
VAR
  North_green : BOOL := FALSE;
  North_yellow : BOOL := FALSE;
  North_red : BOOL := TRUE;
  East_green : BOOL := TRUE;
  East_yellow : BOOL := FALSE;
  East_red : BOOL := FALSE;
  T1 : TON;
END_VAR

T1(PT := 5000ms);

WHILE TRUE DO
  IF T1.Q THEN
    North_green := FALSE;
    North_red := TRUE;
    East_green := FALSE;
    East_yellow := TRUE;
  ELSE
    North_green := FALSE;
    North_yellow := FALSE;
    North_red := TRUE;
    East_green := TRUE;
    East_yellow := FALSE;
  END_IF;

  IF T1.Q THEN
    T1 := 0;
  ELSE
    IF T1.PT >= 9500ms THEN
      East_green := FALSE;
      East_red := TRUE;
      East_yellow := TRUE;
    ELSEIF T1.PT >= 5500ms THEN
      North_green := FALSE;
      North_red := TRUE;
      East_green := TRUE;
      East_yellow := FALSE;
    END_IF;
  END_IF;

  WAIT;
END_WHILE;