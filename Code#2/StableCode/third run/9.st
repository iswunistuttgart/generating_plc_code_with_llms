// 15.140922784805298s
// 1

// Function declaration 
BOOL IsLeapYear(int Year) 
{ 
    // Return TRUE if Year is divisible by 4, 
    // otherwise return FALSE 
    return (Year % 4 == 0); 
} 
  
// Main Method 
int main() 
{ 
    int Year;
    Console.Write("Enter a year: "); 
    Year = Console.ReadLine().ToInt32(); 
    Console.WriteLine(IsLeapYear(Year)? "Yes" : "No"); 
    return 0; 
}