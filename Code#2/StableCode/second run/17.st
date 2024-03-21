// 22.28273606300354s
// 2
// Declare Variables
INT aiOutside, aiHumidity;
STRING sShowText;

// Set up control structure
IF (aiHumidity > 40 && aiHumidity < 75) THEN
    // Show Optimum
ELSE IF (18 <= TEMPERATURE <= 25) THEN
    // Show Cold
ELSE
    // Show Hot
    sShowText = "Temp. OK";
END_IF

// Print the temperature and humidity
sShowText = CONCAT(sShowText, " ", aiOutside);