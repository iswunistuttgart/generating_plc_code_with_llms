// 26.75s
// 4
VAR_INPUT
    N : INT;
    K : INT;
END_VAR

VAR
    Result : LREAL;  (* Using LREAL for potentially large results *)
    i : INT;
END_VAR

(* Initialize result *)
Result := 1;

(* Adjust K for optimization *)
IF K > N - K THEN
    K := N - K;
END_IF;

(* Calculate binomial coefficient *)
FOR i := 0 TO K - 1 DO
    Result := Result * (N - i) / (i + 1);
END_FOR;
