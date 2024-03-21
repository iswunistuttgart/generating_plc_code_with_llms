// 24.85s
// 3
VAR_INPUT
    N : INT;
    K : INT;
END_VAR

VAR
    i : INT;
    N_Factorial : INT := 1; // N!
    K_Factorial : INT := 1; // K!
    NK_Factorial : INT := 1; // (N-K)!
    BinCoeff : INT; // Binomial Coefficient
END_VAR

// Calculate N!
FOR i := 1 TO N DO
    N_Factorial := N_Factorial * i;
END_FOR

// Calculate K!
FOR i := 1 TO K DO
    K_Factorial := K_Factorial * i;
END_FOR

// Calculate (N-K)!
FOR i := 1 TO N - K DO
    NK_Factorial := NK_Factorial * i;
END_FOR

// Calculate Binomial Coefficient: N! / (K! * (N-K)!)
BinCoeff := N_Factorial / (K_Factorial * NK_Factorial);
