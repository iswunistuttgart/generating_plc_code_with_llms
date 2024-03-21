// 10.41s
// 4
FUNCTION_BLOCK INTERLOCK
    VAR_INPUT
        I1 : BOOL;
        I2 : BOOL;
        TL : TIME;
    END_VAR

    VAR_OUTPUT
        Q1 : BOOL;
        Q2 : BOOL;
    END_VAR

    VAR
        T1 : TOF;
        T2 : TOF;
    END_VAR

    // Interlock logic
    T1(IN := I1 AND NOT Q2, PT := TL);
    T2(IN := I2 AND NOT Q1, PT := TL);

    Q1 := I1 AND NOT T2.Q;
    Q2 := I2 AND NOT T1.Q;

END_FUNCTION_BLOCK
