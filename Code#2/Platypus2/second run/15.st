// 92.80798411369324s
// 2
FUNCTION FC1002 :BOOL
VAR_INPUT
	E_A, SENSOR: BOOL;
	ZEITW: TIME;
END_VAR
VAR_IN_OUT
	ZEIT:TON;
	P_HU, P_AL: BOOL;
END_VAR
IF E_A THEN
	P_HU := FALSE;
	P_AL := FALSE;
	WHILE SENSOR DO
		IF ZEIT > 3000 THEN
			P_HU := TRUE;
			P_AL := FALSE;
		END_WHILE
	ELSE
		P_HU := FALSE;
		P_AL := TRUE;
	END_IF
	RETURN(TRUE);
END_FUNCTION