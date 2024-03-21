FUNCTION BINOM : INT
  VAR_INPUT
    N : INT;
    K : INT;
    i : INT;
  END_VAR

  IF 2 * K > n THEN
  	k := n - k;
  END_IF;
  IF k > n THEN
  	RETURN;
  ELSIF k = 0 OR k = n THEN
  	BINOM := 1;
  ELSIF k = 1 THEN
  	BINOM := n;
  ELSE
  	BINOM := n;
  	n := n + 1;
  	FOR i := 2 TO k DO
  		BINOM := BINOM * (n - i) / i;
  	END_FOR;
  END_IF;

END_FUNCTION
