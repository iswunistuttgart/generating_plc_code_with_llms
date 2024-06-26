FUNCTION SIGMOID : REAL
  VAR_INPUT
    X : REAL;
  END_VAR

  IF X > 20.0 THEN
  	SIGMOID := 1.0;
  ELSIF x < -85.0 THEN
  	SIGMOID := 0.0;
  ELSE
  	SIGMOID := 1.0 / (1.0 + EXP(-X));
  END_IF;
  (* from OSCAT library; www.oscat.de  *)
END_FUNCTION