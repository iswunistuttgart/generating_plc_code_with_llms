// 64.56s
// 4
FUNCTION FC1002 : BOOL
VAR_INPUT
    E_A : BOOL;     (* Switch for enabling/disabling the monitoring system *)
    SENSOR : BOOL;  (* Ultrasonic sensor input *)
    ZEITW : TIME;   (* Time duration for switching from warning to alarm *)
END_VAR
VAR_IN_OUT
    ZEIT : TON;     (* Timer for measuring the duration of perception *)
    P_HU : BOOL;    (* Horn for acoustic warning signal *)
    P_AL : BOOL;    (* Alarm signal *)
END_VAR

(* Monitoring system activation *)
IF E_A THEN
    (* When monitoring system is enabled *)
    IF SENSOR THEN
        ZEIT(IN := TRUE, PT := ZEITW);
        IF ZEIT.Q THEN
            P_HU := FALSE;  (* Turn off horn after time window *)
            P_AL := TRUE;   (* Activate alarm *)
        ELSE
            P_HU := TRUE;   (* Activate horn if object/person is detected *)
        END_IF;
    ELSE
        ZEIT(IN := FALSE);
        P_HU := FALSE;  (* Turn off horn if no object/person is detected *)
    END_IF;
ELSE
    (* When monitoring system is disabled *)
    P_HU := FALSE;
    P_AL := FALSE;
    ZEIT(IN := FALSE);
END_IF;

FC1002 := E_A;  (* Return the status of the monitoring system *)

END_FUNCTION
