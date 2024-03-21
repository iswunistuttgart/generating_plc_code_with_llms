// 15.930060148239136s
// 1

// Function declaration 
BOOL IsLeapYear(int Year) 
{ 
   if (Year % 4 == 0 && Year % 100!= 0 || Year % 400 == 0) 
       return TRUE; 
   else
       return FALSE; 
} 

// Main method 
public static void Main() 
{ 
    // Declare variables
    int YEAR = 2020; 

    // Check if the year is a leap year or not
    Console.WriteLine(IsLeapYear(YEAR)); 
}