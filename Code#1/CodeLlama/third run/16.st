// 43.53682279586792s
// 2 (Timer nicht richtig ausgelesen)
```
PROGRAM TRAFFIC_LIGHT;
VAR
	North_green, North_yellow, North_red : BOOL;
	East_green, East_yellow, East_red : BOOL;
	TON : TIME;
END_VAR;

IF TON < 5000 THEN
	North_green := TRUE;
	East_red := TRUE;
ELSIF TON >= 5000 AND TON < 5500 THEN
	North_yellow := TRUE;
	East_red := TRUE;
ELSIF TON >= 5500 AND TON < 9500 THEN
	North_red := TRUE;
	East_green := TRUE;
ELSIF TON >= 9500 AND TON < 10000 THEN
	East_yellow := TRUE;
END_IF;
```