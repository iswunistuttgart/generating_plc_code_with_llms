// 29.25s
// 3
VAR_INPUT
    X : REAL;  (* Input for the Lambert W function *)
END_VAR

VAR
    w : REAL;      (* Approximation of W(x) *)
    i : INT;       (* Iteration counter *)
    we : REAL;     (* w * exp(w) *)
    w1e : REAL;    (* (w + 1) * exp(w) *)
    ewx : REAL;    (* exp(w) - X/w *)
    last : DWORD;  (* To check for convergence *)
END_VAR

(* Initial guess *)
IF X = 0 THEN
    w := 0;
ELSE
    w := LOG(X);  (* Logarithmic approximation for starting value *)
END_IF;

last := TO_DWORD(w);
FOR i := 1 TO 100 DO  (* Limiting iterations to 100 for safety *)
    we := w * EXP(w);
    w1e := (w + 1) * EXP(w);
    ewx := EXP(w) - X / w;

    (* Newton's Method update *)
    w := w - we / (w1e - ewx);

    (* Check for convergence *)
    IF last = TO_DWORD(w) THEN
        EXIT;  (* Exit loop if converged *)
    END_IF;
    last := TO_DWORD(w);
END_FOR;
