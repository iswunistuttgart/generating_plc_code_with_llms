//37.56s
//2
PROGRAM SigmoidFunction
VAR
    x : REAL; (* Input: the independent variable x *)
    sigmoid : REAL; (* Output: the value of the sigmoid function *)
    e : REAL; (* The base of natural logarithms *)
END_VAR

(* Set the value for the base of natural logarithms *)
e := 2.7182818284590452354; (* Approximate value of e *)

(* Calculate the sigmoid function *)
sigmoid := 1 / (1 + (e ** (-x)));

END_PROGRAM
