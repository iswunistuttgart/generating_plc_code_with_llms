// 43.60401630401611s
// 1
procedure lambertW(varInput, var) 
   VAR input : REAL;
   VAR output : REAL;
   VAR i : INT;
   VAR j : INT;
   VAR k : INT;
   VAR l : INT;
   VAR m : INT;
   VAR n : INT;
   VAR o : INT;
   VAR p : INT;
   VAR q : INT;
   VAR r : INT;
   VAR s : INT;
   VAR t : INT;
   VAR u : INT;
   VAR v : INT;
   VAR w : REAL;
   VAR x : REAL;
   VAR y : REAL;
   VAR z : REAL;
begin
    output := 0.0;
    w := input(1);
    x := input(2);
    y := input(3);
    z := input(4);
    for i := 1 to 5 do
       for j := 1 to 5 do
          for k := 1 to 5 do
             for l := 1 to 5 do
                for m := 1 to 5 do
                   for n := 1 to 5 do
                      for o := 1 to 5 do
                         for p := 1 to 5 do
                            for q := 1 to 5 do
                               r := w(i) + x(j) + y(k) + z(l) - u(m) - v(n) - w1e(o) - ewx(p) - last(q);
                               s := abs(r);
                               if s > output then
                                  output := s;
                                  varInput(i, j, k, l, m, n, o, p, q, r, u, v, w1e, ewx, last) := input;
                              end if;
                         end for;
                      end for;
                   end for;
                end for;
               end for;
            end for;
         end for;
      end for;
   end for;
end procedure lambertW;