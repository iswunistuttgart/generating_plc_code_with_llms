// 5.254760026931763s
// 1
function checkLeapYear(YEAR) {
    if (YEAR % 4 == 0 && YEAR % 100!= 0 || YEAR % 400 == 0)
        return true;
    else
        return false;
}