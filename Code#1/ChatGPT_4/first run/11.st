//30.17s
//4
PROGRAM SignFunction
VAR
    x : REAL; (* Input: the independent variable x *)
    sign : INT; (* Output: the value of the sign function *)
END_VAR

(* Calculate the sign function *)
IF x < 0 THEN
    sign := -1;
ELSIF x = 0 THEN
    sign := 0;
ELSE
    sign := 1;
END_IF;

END_PROGRAM
