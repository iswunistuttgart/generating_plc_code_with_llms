// 16.75307559967041s
// 1
public static void FC1002(OBJECT obj) {
    VAR_INPUT();
    VAR_IN_OUT();
    FUNCTION fc1002 :BOOL {
        E_A = TRUE;
        SENSOR = FALSE;
        ZEITW = TIME.CurrentTime;
        RETURN false;
    }
    END_FUNCTION
}