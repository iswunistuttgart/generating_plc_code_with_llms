// 62.384010553359985s
// 1
program main;

// Declare variables and constants
integer i, n;
real x;
constant pi = 3.14159265358979323846264338327950288419716939937510;

// Function definition
function sign(x)
    input real x;
    output integer s;

    if (x > 0.0) then
        s := 1;
    elseif (x < 0.0) then
        s := -1;
    else
        s := 0;
    end_if;
end_function;

// Main program logic
write("Enter a number: ");
read(n);
write("The sign of ", n, " is ", sign(n));

// End of program
stop;