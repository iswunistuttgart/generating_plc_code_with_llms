// 51.47999310493469s
// 3
```
FUNCTION FC1001 :BOOL
VAR_INPUT
	MEW: REAL;
	SP: REAL;
	HYS: REAL;
END_VAR
VAR_IN_OUT
 	OUT:BOOL;
END_VAR
VAR
 	P_HYS: REAL;
END_VAR
BEGIN
	IF (MEW > SP) THEN
		IF (MEW - SP > HYS * SP) THEN
			OUT := TRUE;
		ELSE
			OUT := FALSE;
		END_IF;
	ELSIF (MEW < SP) THEN
		IF (SP - MEW > HYS * SP) THEN
			OUT := TRUE;
		ELSE
			OUT := FALSE;
		END_IF;
	ELSE
		OUT := FALSE;
	END_IF;
END_FUNCTION
```