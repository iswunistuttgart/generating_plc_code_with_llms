VAR 
    YEAR : INT
END_VAR

IF (year MOD INT#400) = INT#00 THEN
  leap_year := TRUE;
ELSIF (year MOD INT#100) = INT#00 THEN
  leap_year := FALSE;
ELSIF (year MOD INT#04) = INT#00 THEN
  leap_year := TRUE;
ELSE
  leap_year := FALSE;
END_IF;