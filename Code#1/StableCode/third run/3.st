// 7.423486948013306s
// 1
function calculateFibonacci(n) {
    if (n <= 2) return 1;

    let fib = [0, 1];
    for (let i = 2; i < n; i++) {
        fib.push(fib[i-1] + fib[i-2]);
    }

    return fib[n - 1];
}