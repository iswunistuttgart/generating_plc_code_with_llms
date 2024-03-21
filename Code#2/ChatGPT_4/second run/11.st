// 17.44s
// 4
VAR_INPUT
    x : REAL;  (* Input number *)
END_VAR

VAR
    signResult : INT;  (* Result of the sign function *)
END_VAR

IF x > 0 THEN
    signResult := 1;  (* Positive number *)
ELSIF x < 0 THEN
    signResult := -1;  (* Negative number *)
ELSE
    signResult := 0;  (* Zero *)
END_IF;
