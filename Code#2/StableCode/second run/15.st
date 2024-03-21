// 32.841773986816406s
// 2
function FC1002(input, output) :BOOL
    VAR_INPUT
        E_A, SENSOR: BOOL;
        ZEITW: TIME;
    END_VAR

    VAR_IN_OUT
        ZEIT:TON;
        P_HU, P_AL: BOOL;
    END_VAR

// Input variables
	FUNCTION FC1002 :BOOL
		E_A, SENSOR: BOOL;
		ZEITW: TIME;
	END_FUNCTION

	IF input.E_A = 0 THEN
		RETURN FALSE;
	END_IF

	IF input.SENSOR = TRUE THEN
        ZEITW := input.ZEITW + 3;
    ELSE
        ZEITW := input.ZEITW;
    END_IF

    IF ZEITW > TIME THEN
        P_HU := FALSE;
        P_AL := TRUE;
    ELSE
        P_HU := TRUE;
        P_AL := FALSE;
    END_IF

	RETURN (P_HU, P_AL);
END_FUNCTION