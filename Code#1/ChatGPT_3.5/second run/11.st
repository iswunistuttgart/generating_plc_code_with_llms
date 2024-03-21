//7.44s
//4
FUNCTION Sign: INT
VAR_INPUT
    x: REAL;  // Input value
END_VAR

VAR
    sign_result: INT := 0;
END_VAR

BEGIN
    IF x > 0.0 THEN
        sign_result := 1;
    ELSIF x < 0.0 THEN
        sign_result := -1;
    ELSE
        sign_result := 0;
    END_IF

    Sign := sign_result;
END_FUNCTION
