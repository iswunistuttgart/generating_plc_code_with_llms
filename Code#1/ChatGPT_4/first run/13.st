//48.01s
//2
PROGRAM NumberSearch
VAR
    numberList: ARRAY [1..100] OF INT; (* Array containing 100 random numbers *)
    found: BOOL; (* Output: TRUE if the number 10 is found, otherwise FALSE *)
    index: INT; (* Index for the current position in the list *)
END_VAR

(* Initialize variables *)
found := FALSE;
index := 1;

(* Search for the number 10 using REPEAT loop and EXIT statement *)
REPEAT
    IF numberList[index] = 10 THEN
        found := TRUE; (* Set found to TRUE if number 10 is found *)
        EXIT; (* Exit the loop *)
    END_IF;
    
    index := index + 1; (* Move to the next index *)
UNTIL index > 100; (* Exit the loop if the end of the list is reached *)

(* Output whether the number 10 was found *)
IF found THEN
    (* Implement actions to take if the number 10 is found *)
ELSE
    (* Implement actions to take if the number 10 is not found *)
END_IF;

END_PROGRAM
