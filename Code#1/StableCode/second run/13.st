// 14.731139898300171s
// 1
IEC 61131-3 - Structured Text Program

PROGRAM	IEC 61131-3 - Structured Text Program

/********** Declaration of data types **********/

DATA	NUMBERS(10) / 100;

/********** Global variables **********/

GLOBAL	NUMBER	SELECTED, ABORTED;

/********** Functions declaration **********/

FUNCTION	SELECT_NUMBER() PURE;
FUNCTION	REPEAT() PURE;
FUNCTION	EXIT() PURE;

END IEC 61131-3 - Structured Text Program