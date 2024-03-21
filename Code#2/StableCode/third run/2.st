// 18.492331743240356s
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

// Driver Code 
public static void main(String[] args) { 
  
    // Input values 
    int n = 5, k = 2; 
  
    System.out.println("Binomial coefficient is " + binomialCoefficient(n, k)); 
}