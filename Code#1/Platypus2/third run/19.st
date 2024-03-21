// 69.78339076042175s
// 2
```
THICKNESS(MD_1)
D_MAX := MD_1;
D_MIN := MD_1;
IF (S1 = 0) THEN
    IF (D_MAX > V_MAX OR D_MIN < V_MIN) THEN
        P1 := TRUE;
    ELSE
        P1 := FALSE;
    END_IF;
END_IF;
```