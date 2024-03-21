FUNCTION SINH : REAL
  VAR
    X : REAL;
  END_VAR

  IF ABS(x) < 2.0E-3 THEN
  	SINH := X;
  ELSE
  	SINH := (EXP(x) - EXP(-x)) * 0.5;
  END_IF;
  (* from OSCAT library; www.oscat.de  *)
END_FUNCTION