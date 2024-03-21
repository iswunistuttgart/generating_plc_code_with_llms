// 86.31310868263245s
// 2
PROGRAM binomial_coefficient;

VAR_INPUT
    N : INT;
    K : INT;
    i : INT;
END_VAR

BEGIN
    WRITE(N, 'Enter the number of elements in the set:');
    READLN(N);
    WRITE(K, 'Enter the number of elements to choose from the set:');
    READLN(K);

    i := 1;
    WHILE (i <= K) DO
        IF (i MOD 2 = 0) THEN
            WRITE(' ', N - i + 1, '!', '/', i, '=', i * (N - i));
        ELSE
            WRITE(' ', N - i + 1, '!', '/', i, '=', (i - 1) * (N - i));
        END_IF;
        INC(i);
    END_WHILE;
END_PROGRAM.