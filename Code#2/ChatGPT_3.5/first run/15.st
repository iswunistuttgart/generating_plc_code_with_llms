// 8.78s
// 2
FUNCTION FC1002 : BOOL
VAR_INPUT
	E_A, SENSOR: BOOL;
	ZEITW: TIME;
END_VAR

VAR_IN_OUT
	ZEIT: TON;
	P_HU, P_AL: BOOL;
END_VAR

(* FC1002 function implementation *)
IF E_A THEN
    IF SENSOR THEN
        ZEIT(IN := TRUE, PT := ZEITW);
        P_HU := NOT ZEIT.Q;
        P_AL := ZEIT.Q;
    ELSE
        ZEIT(IN := FALSE);
        P_HU := FALSE;
        P_AL := FALSE;
    END_IF;
ELSE
    ZEIT(IN := FALSE);
    P_HU := FALSE;
    P_AL := FALSE;
END_IF;

(* Return the output state *)
RETURN E_A;
