// 10.82s
// 2
FUNCTION_BLOCK FB1005
VAR_INPUT
    START: BOOL; 
    DICKE, V_MAX, V_MIN: REAL;
END_VAR

VAR_OUTPUT
    D_MAX, D_MIN: REAL; 
    P1: BOOL;
END_VAR

VAR
    FO: BOOL;
    M_MAX, M_MIN: REAL;
END_VAR

METHOD CheckThickness: BOOL
VAR_INPUT
    S1: BOOL;
END_VAR
VAR
    CurrentThickness: REAL;
BEGIN
    (* Check if the sensor is active *)
    IF S1 THEN
        (* Calculate the thickness from the difference of laser measurements *)
        CurrentThickness := DICKE;

        (* Update the maximum and minimum thickness values *)
        IF CurrentThickness > M_MAX THEN
            M_MAX := CurrentThickness;
        END_IF;

        IF CurrentThickness < M_MIN THEN
            M_MIN := CurrentThickness;
        END_IF;

        (* Check if the current thickness is outside the tolerance band *)
        IF CurrentThickness > V_MAX OR CurrentThickness < V_MIN THEN
            P1 := TRUE; (* Switch on the reject light *)
        ELSE
            P1 := FALSE; (* Switch off the reject light *)
        END_IF;
    END_IF;

    (* Output the maximum and minimum thickness values *)
    D_MAX := M_MAX;
    D_MIN := M_MIN;

    (* Reset the thickness values at the start of a new measurement *)
    IF NOT S1 THEN
        M_MAX := 0.0;
        M_MIN := 9999.0; (* Assign an initial large value for comparison *)
    END_IF;

    (* Return the status of the reject light *)
    RETURN P1;
END_METHOD

END_FUNCTION_BLOCK
