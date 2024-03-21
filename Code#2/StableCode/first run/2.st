// 13.820787191390991s
// 1

// Function to calculate binomial coefficient 
public static int binomialCoefficient(int n, int k) { 
    if (k > n - k) 
        k = n - k; 
  
    int res = 1; 
    for (int i = 0; i < k; ++i) { 
        res *= (n - i); 
        res /= (i + 1); 
    } 
    return res; 
}