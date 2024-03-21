// 90.31549715995789s
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
            WRITE(' ', N - i, '!/(', i, '!) = ', N - i, '/', i, '= ', N - i + i);
        ELSE
            WRITE(' ', N - i, '!/(', i, ') = ', N - i, '/', i, '= ', N - i + i);
        END_IF;
        INC(i);
    END_WHILE;
END_PROGRAM.