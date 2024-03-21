// 28.394740104675293s
// 1
// Declare Variables
INT aiOutside, aiHumidity;
STRING sShowText;

// Initialize Variables
aiOutside = 0;
aiHumidity = 0;
sShowText = "";

// Read Temperature and Humidity
IF (aiHumidity > 40 && aiHumidity < 75) THEN
    // Show Optimum Text
    sShowText := "Opt";
ELSE IF (aiOutside >= 18 && aiOutside <= 25) THEN
    // Show Cold Text
    sShowText := "Cold";
ELSE IF (aiOutside > 25) THEN
    // Show Hot Text
    sShowText := "Hot";
END_IF

// Display Temperature and Humidity
PRINT ("Temp: ");
PRINT (aiOutside);
PRINT ("�C, ");
PRINT (sShowText);