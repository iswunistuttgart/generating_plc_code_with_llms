// 11.08s
// 2
FUNCTION_BLOCK INTERLOCK
    VAR_INPUT
        I1: BOOL;
        I2: BOOL;
        TL: TIME;
    END_VAR

    VAR_OUTPUT
        Q1: BOOL;
        Q2: BOOL;
    END_VAR

    VAR
        T1: TOF(TL);
        T2: TOF(TL);
    END_VAR

    (* Interlock logic *)
    T1(IN:=NOT Q2 AND I1);
    T2(IN:=NOT Q1 AND I2);

    Q1 := T1.Q;
    Q2 := T2.Q;

END_FUNCTION_BLOCK
