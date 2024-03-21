// 45.69720149040222s
// 1
procedure lambertW(varInput, var)
  VAR 
    X : REAL;
  END_VAR

  VAR 
    w : REAL;
    i : INT;
    we : REAL;
    w1e : REAL;
    ewx : REAL;
    last : DWORD;
  END_VAR

  begin

    for (i := 0 to 254) do 
      begin
        X := varInput.real(i); 
        w := lambertWValue(X);
        we := lambertWeValue(w, X);
        w1e := lambertWValue(we, X);
        ewx := lambertEwValue(w1e, X);
        last := i;
      end

    writeln("last = ", last);

  end procedure lambertW;

procedure lambertWValue(x, var)
  VAR 
    w : REAL;
    x : REAL;
  END_VAR

  begin
    w := (2 * pi) * exp(-x**2 / 2); 
  end procedure lambertWValue;

procedure lambertWeValue(w, var)
  VAR 
    we : REAL;
    w : REAL;
    var : REAL;
  END_VAR

  begin
    we := sqrt((var**2 + (w*var)) / (var**2 + 1)); 
  end procedure lambertWeValue;

procedure lambertW1eValue(x, var)
  VAR 
    w1e : REAL;
    x : REAL;
    var : REAL;
  END_VAR

  begin
    w1e := sqrt((var**2 + (w*var)) / (var**2 + 1)); 
  end procedure lambertW1eValue;

procedure lambertEwValue(w1e, var)
  VAR 
    ewx : REAL;
    w1e : REAL;
    var : REAL;
  END_VAR

  begin
    ewx := sqrt((var**2 + (w*var)) / (var**2 + 1)); 
  end procedure lambertEwValue;