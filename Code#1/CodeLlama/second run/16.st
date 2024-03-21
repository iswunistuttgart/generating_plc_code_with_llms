// 42.21020460128784s
// 2 (Timer nicht richtig ausgelesen)
```
PROGRAM TRAFFIC_LIGHTS;
VAR
	North_green, North_yellow, North_red : BOOL;
	East_green, East_yellow, East_red : BOOL;
	TON : TIME;
END_VAR;

IF TON < 5000 THEN
	North_green := TRUE;
	East_red := TRUE;
ELSIF TON >= 5000 AND TON < 6000 THEN
	North_yellow := TRUE;
	East_red := FALSE;
ELSIF TON >= 9500 AND TON < 10000 THEN
	North_red := TRUE;
	East_green := TRUE;
ELSE
	North_red := FALSE;
	East_yellow := TRUE;
END_IF;
```