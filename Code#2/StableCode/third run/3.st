// 18.826030015945435s
// 2

// Fibonacci sequence
function fibonacci(x) 
    VAR 
        t1,t2 : DINT;
        x_tmp : INT;
    BEGIN
        // Initialize variables
        X := 0;
        t1 := 0;
        t2 := 1;

        WHILE X < x DO
            SET X := X + 1;

            SET t1 := t1 + t2;
            SET t2 := t1 - t2;

            SET x_tmp := t1 * t2;
            IF x_tmp > X THEN
                SET X := x_tmp;
            END IF;
        END WHILE;

        RETURN X;
    END;
END;