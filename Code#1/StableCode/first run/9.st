// 17.035604000091553s
// 1
// Declare global variables
var leapYear;

// Function to check if YEAR is a leap year
function isLeapYear(year) {
    // If divisible by 4 and not divisible by 100, it's a leap year
    if ((year % 4 == 0) && (year % 100!= 0))
        return true;

    // Otherwise, it's not a leap year
    else
        return false;
}

// Get the user input
YEAR = prompt("Please enter a year: ");

// Check if YEAR is a leap year
if (isLeapYear(YEAR))
    leapYear = YEAR + " is a leap year.";
else
    leapYear = YEAR + " is not a leap year.";

// Print the result
console.log(leapYear);