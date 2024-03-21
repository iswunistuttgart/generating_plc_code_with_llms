// 68.21382689476013s
// 2
```
FUNCTION THICKNESS(MD_1)
    IF MD_1 = 0 THEN
        D_MAX := 0;
        D_MIN := 0;
    ELSE
        D_MAX := MIN(M_MAX, M_MIN);
        D_MIN := MAX(M_MAX, M_MIN);
    END_IF
END_FUNCTION
```