// 10.209294319152832s
// 1
IEC 61131-3 structured text program with an interlock functionality.

//Inputs
input I1, I2;
input Q1, Q2;

always@(*)
begin
  if(I1==1)
    Q1 <= not Q2;
  else if (I2 == 1)
    Q2 <= not Q1;
end