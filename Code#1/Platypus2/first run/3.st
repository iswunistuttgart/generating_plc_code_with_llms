// 42.561323165893555s
// 1
program Fibonacci;

function Fibonacci(n : integer) : integer;
begin
    if n = 0 then
        return 0;
    elseif n = 1 then
        return 1;
    else
        return Fibonacci(n - 1) + Fibonacci(n - 2);
end function;

function main() : void;
begin
    writeln('Enter a number: ');
    readln(n);
    writeln('Fibonacci of ', n, ' is ', Fibonacci(n));
end function main;
