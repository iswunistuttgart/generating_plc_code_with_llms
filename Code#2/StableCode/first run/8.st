// 22.40174627304077s
// 2

// Lambert W Function
function lambertW(X) 
var
  w : REAL;
  i : INT;
  we : REAL;
  w1e : REAL;
  ewx : REAL;
  last : DWORD;
end function

// Input
VAR_INPUT
  X : REAL;
END_VAR

IF (X.GT. 0) THEN
  // Compute We
  we = exp(-X);

  // Compute W1E
  w1e = 1 / (2 * pi * we);

  // Compute EWX
  ewx = 1 - we;

  // Store last
  last = 1;
ELSE
  // Set last to zero
  last = 0;
END IF
RETURN last;