// 22.72326421737671s
// 1

// Function declaration 
BOOL IsLeapYear(INT Year); 

// Main Method 
void main() 
{ 
    // Variable declaration 
    INT Year; 
  
    // Read the year from user 
    Console.WriteLine("Enter a year:"); 
    Year = Int32.Parse(Console.ReadLine()); 
  
    if (IsLeapYear(Year)) 
        Console.WriteLine("{0} is a leap year.", Year); 
    else
        Console.WriteLine("{0} is not a leap year.", Year); 
} 

// Function definition 
BOOL IsLeapYear(INT Year) 
{ 
    if (Year % 4 == 0 && Year % 100!= 0 || Year % 400 == 0) 
        return true; 
  
    else
        return false; 
}