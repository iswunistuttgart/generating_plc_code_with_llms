// 53.274847984313965s
// 2
```
PROGRAM TrafficLight
VAR
    North_green : BOOL;
    North_yellow : BOOL;
    North_red : BOOL;
    East_green : BOOL;
    East_yellow : BOOL;
    East_red : BOOL;
    T1 : TON;
END_VAR

IF (T1 = 0) THEN
    North_green := TRUE;
    East_red := TRUE;
ELSIF (T1 > 5000) THEN
    North_yellow := TRUE;
    East_green := TRUE;
ELSIF (T1 > 9500) THEN
    North_red := TRUE;
    East_yellow := TRUE;
END_IF;
END_PROGRAM;
```