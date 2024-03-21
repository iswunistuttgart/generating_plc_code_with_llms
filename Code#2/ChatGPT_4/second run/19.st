// 43.16s
// 4
FUNCTION_BLOCK FB1005
VAR_INPUT
    START : BOOL;    (* Signal to start and end measurement *)
    DICKE : REAL;    (* Thickness measurement from lasers *)
    V_MAX : REAL;    (* Maximum tolerance value for thickness *)
    V_MIN : REAL;    (* Minimum tolerance value for thickness *)
END_VAR
VAR_OUTPUT
    D_MAX : REAL;    (* Maximum measured thickness *)
    D_MIN : REAL;    (* Minimum measured thickness *)
    P1 : BOOL;       (* Reject light indicator *)
END_VAR
VAR
    FO : BOOL;       (* Flag to indicate ongoing measurement *)
END_VAR

IF START THEN
    IF NOT FO THEN
        (* Start of a new measurement *)
        FO := TRUE;
        D_MAX := DICKE;
        D_MIN := DICKE;
    ELSE
        (* Ongoing measurement *)
        IF DICKE > D_MAX THEN
            D_MAX := DICKE;
        END_IF;

        IF DICKE < D_MIN THEN
            D_MIN := DICKE;
        END_IF;
    END_IF;
ELSE
    IF FO THEN
        (* End of measurement *)
        FO := FALSE;
        
        (* Check if measured values are outside tolerance range *)
        IF D_MAX > V_MAX OR D_MIN < V_MIN THEN
            P1 := TRUE;  (* Set reject light *)
        ELSE
            P1 := FALSE; (* Reset reject light *)
        END_IF;
    END_IF;
END_IF;

END_FUNCTION_BLOCK
