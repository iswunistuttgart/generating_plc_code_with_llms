// 11.291690349578857s
// 1
One_Hour_Timer = Timer()
Start_Loop = False

One_Hour_Timer.Interval = 3600 #1 hour in seconds

One_Hour_Timer.Elapsed += ElapsedTimeExpired

If Start_Loop Then
    If One_Hour_Timer.Elapsed >= 3600 Then
        Start_Loop = False
        Exit Function
    End If
End If