// 38.23284649848938s
// 3
```
PROGRAM GATE_CONTROLLER
VAR
	Start_Loop : BOOL;
	One_Hour_Timer : TON;
	Auth : STRING[10];
	my_defined_str : STRING := '123456789';
END_VAR

IF Start_Loop THEN
	One_Hour_Timer(IN:=TRUE, PT:=T#1h);
ELSE
	IF One_Hour_Timer.Q THEN
		IF Auth = my_defined_str THEN
			Start_Loop := TRUE;
		END_IF
		One_Hour_Timer(IN:=FALSE, PT:=T#1h);
	ELSE
		IF NOT One_Hour_Timer.Q AND Start_Loop THEN
			Start_Loop := FALSE;
		END_IF
	END_IF
END_IF
```