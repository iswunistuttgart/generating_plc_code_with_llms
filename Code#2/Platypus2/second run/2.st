// 73.03599262237549s
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
        IF (i = 1) THEN
            WRITE('0');
        ELSE
            WRITE((i - 1), '!');
        END_IF;
        i := i + 1;
    END_WHILE;
END_PROGRAM.