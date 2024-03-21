//34.25s
//2
PROGRAM HyperbolicSineFunction
VAR
    x : REAL; (* Input: the independent variable x *)
    sinh_x : REAL; (* Output: the value of the hyperbolic sine function *)
    e : REAL; (* The base of natural logarithms *)
END_VAR

(* Set the value for the base of natural logarithms *)
e := 2.7182818284590452354; (* Approximate value of e *)

(* Calculate the hyperbolic sine function using the exponential function *)
sinh_x := (e ** x - e ** (-x)) / 2;

END_PROGRAM
