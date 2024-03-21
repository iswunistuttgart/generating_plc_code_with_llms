// 23.840668439865112s
// 1

// Fibonacci number calculation in C
#include <stdio.h> 
#include <string.h> 

int main() { 
    char VAR_INPUT[100]; // Input string
    int X, i, j; 
    strcpy(VAR_INPUT, "1");

    for (i = 2; i <= 8; ++i) { 
        x_tmp = atoi(VAR_INPUT);
        t1 = 0; 
        t2 = 1; 

        for (j = 1; j <= i; ++j) { 
            X = t1 + t2;
            strcpy(VAR_INPUT, itoa(X, VAR_INPUT+3, 10));
            t1 = t2; 
            t2 = X; 
        } 
    } 

    printf("Fibonacci number is %d", x_tmp);
    return 0;
}