// 17.013244152069092s
// 1
function fibonacci(x) {
    var t1 = 0;
    var t2 = 1;
    var x_tmp = 0;

    VAR_INPUT
        X : INT;
    END_VAR

    FOR x_tmp = 0 TO X
        t1 = t1 + t2;
        t2 = t1 - t2;

        IF (t1 > x) THEN
            RETURN t1;
        ELSEIF (t2 > x) THEN
            RETURN t2;
        END IF;
    END FOR;

    RETURN 0;
}