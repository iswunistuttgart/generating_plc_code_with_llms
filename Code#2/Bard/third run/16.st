// 9.09s
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

PROGRAM main

North_green := TRUE;
North_yellow := FALSE;
North_red := FALSE;
East_green := FALSE;
East_yellow := FALSE;
East_red := TRUE;

T1 := 5000;

WHILE TRUE DO
  WAIT ON T1;

  IF T1.Q THEN
    North_green := FALSE;
    North_yellow := TRUE;

    IF T1.CT >= 9500 THEN
      North_yellow := FALSE;
      North_red := TRUE;
      East_green := TRUE;
      East_yellow := FALSE;
    ELSE
      East_red := TRUE;
    ENDIF;
  ENDIF;
END_WHILE;

END_PROGRAM