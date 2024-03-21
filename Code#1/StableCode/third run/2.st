// 6.956084728240967s
// 1
function calculateBinomialCoefficient(n, k) {
    let coefficient = 1;

    for (let i = n - k + 1; i <= n; i++) {
        coefficient *= i;
    }

    for (let j = 2; j <= k; j++) {
        coefficient /= j;
    }

    return coefficient;
}