//32.92s
//2
PROGRAM LambertWFunction
VAR
    x : REAL; (* Input: the value for which we want to compute the Lambert W function *)
    w : REAL; (* Output: the approximation of the Lambert W function *)
    tol : REAL; (* Tolerance for the approximation *)
    max_iter : INT; (* Maximum number of iterations *)
    iter : INT; (* Iterator *)
    e : REAL; (* Base of natural logarithm *)
    w_next : REAL; (* Next approximation of the Lambert W function *)
END_VAR

(* Initialize variables *)
w := 0; (* Initial guess for W(x) *)
tol := 1E-5; (* Set the tolerance for the approximation *)
max_iter := 100; (* Set the maximum number of iterations *)
iter := 0; (* Initialize iteration counter *)
e := 2.71828182845904523536; (* Approximation of e *)

(* Implementing Halley's method to approximate the Lambert W function *)
REPEAT
    w_next := w - ((w * e ** w - x) / (e ** w + w * e ** (2 * w)));
    iter := iter + 1;
    IF ABS(w_next - w) < tol OR iter >= max_iter THEN
        EXIT;
    END_IF;
    w := w_next;
UNTIL FALSE;

(* Output the result *)
w := w_next;

END_PROGRAM
