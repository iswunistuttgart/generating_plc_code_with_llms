// 58.38280272483826s
// 2

//IEC 61131-3 Structured Text Program to Implement Specified Number Is Selected From A List Of 100 Numbers
//Randomly Generated List
//Abortion Conditions
//Repeat Statement
//Exit Statement
//Pay Attention To Quotaions Marks For String Type
//Implementing Function Should Be Avoided
//Variables should be declared inside the function; the return value should be stored in a variable named after the function; RETURN should be used correctly, to return to the main method and not to return a value
//Only following variables should be used:
//VAR CONSTANT
    //MAXNUMBERS : UINT := 99;
END_VAR

VAR
    aNumbers : ARRAY[0..MAXNUMBERS] OF INT;
    nCnt : INT;
END_VAR

VAR
    nSelectedNumber : INT;
    bFound : BOOLEAN;
    i : INTEGER;
END_VAR

VAR
    iec61131_3_structured_text_program_implement_specified_number_is_selected_from_a_list_of_100_numbers_randomly_generated_list_abortion_conditions_repeat_statement_exit_statement_pay_attention_to_quotaions_marks_for_string_type_implementing_function_should_be_avoided : BOOLEAN;
END_VAR

//Function to Initialize the Array
FUNCTION InitArray()
    nCnt := 0;
    FOR i FROM 1 TO MAXNUMBERS
        aNumbers(i) := 0;
    END OF
    FOR i FROM 1 TO MAXNUMBERS
        IF (nCnt > 99) THEN
            RETURN;
        END IF;
        aNumbers(nCnt + 1) := Randomize();
        nCnt := nCnt + 1;
    END OF
END FUNCTION;

//Function to Select A Specified Number From The List
FUNCTION SelectNumber()
    bFound := FALSE;
    FOR i FROM 1 TO MAXNUMBERS
        IF (aNumbers(i) = 10) THEN
            Abort("Number 10 Found");
            RETURN;
        END IF;
        nSelectedNumber := aNumbers(i);
        bFound := TRUE;
    END OF;
    IF (bFound == FALSE) THEN
        PrintString("No Number Selected");
    ELSE
        PrintString("Number Selected : ");
        PrintInt