// 26.766207933425903s
// 2
// Declare Variables
INT aiOutside, aiHumidity;
STRING sShowText;

// Initialize Variables
aiOutside = 0;
aiHumidity = 0;
sShowText = "";

// Check Temperature and Display Text
IF (aiHumidity < 40 || (aiHumidity > 75 && aiOutside > 18) || aiOutside > 25) THEN
    sShowText := "Temp. OK";
ELSE IF (aiHumidity >= 40 && aiHumidity <= 75 && aiOutside > 18 && aiOutside < 25) THEN
    sShowText := "Opt";
ELSE
    sShowText := "Hot";
END_IF

// Display Result
Display.Message(sShowText);