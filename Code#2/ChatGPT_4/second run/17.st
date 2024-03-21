// 28.0s
// 3
VAR
    aiOutside : INT;       (* Analog input for outside temperature *)
    aiHumidity : INT;      (* Analog input for humidity *)
    sShowText : STRING[80];(* String to display the message *)
END_VAR

(* Convert the analog inputs to temperature and humidity values *)
(* Assuming the range of the analog input is from 0 to 32767 and this corresponds to -40 to 60 °C for temperature and 0 to 100% for humidity *)
VAR
    fTemperature : REAL; (* Temperature in degrees Celsius *)
    fHumidity : REAL;    (* Humidity in percentage *)
END_VAR

fTemperature := (aiOutside / 32767.0) * 100.0 - 40.0;  (* Conversion formula *)
fHumidity := (aiHumidity / 32767.0) * 100.0;           (* Conversion formula *)

(* Evaluate temperature and humidity to set the display text *)
IF fTemperature < 18 THEN
    sShowText := 'Cold';
ELSIF fTemperature <= 25 THEN
    IF fHumidity >= 40 AND fHumidity <= 75 THEN
        sShowText := 'Opt';
    ELSE
        sShowText := 'Temp. OK';
    END_IF;
ELSE
    sShowText := 'Hot';
END_IF;
