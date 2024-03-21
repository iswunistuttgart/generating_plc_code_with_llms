FUNCTION FIB : DINT
  VAR_INPUT
    X : INT;
  END_VAR
  VAR
    t1 : DINT;
    t2 : DINT;
    x_tmp : INT;
  END_VAR

  t1 := DINT#0;
  t2 := DINT#0;
  X_tmp := X;
  IF X_tmp < 0 OR X_tmp > 46 THEN
  	FIB := DINT#-1;
  ELSIF X_tmp < 2 THEN
  	FIB := INT_TO_DINT(X_tmp);
  	RETURN;
  ELSE
  	(* the fibonacci number is the sum of the two suceeding fibonaci numbers *)
  	(* we store the numbers alternatively in t1 and t2 depending on pt *)
  	t2 := DINT#1;
  	WHILE X_tmp > 3 DO
  		X_tmp := X_tmp - 2;
  		t1 := t1 + t2;
  		t2 := t1 + t2;
  	END_WHILE;
  	IF X_tmp > 2 THEN t1 := t1 + t2; END_IF;
  	fib := t1 + t2;
  END_IF;
END_FUNCTION