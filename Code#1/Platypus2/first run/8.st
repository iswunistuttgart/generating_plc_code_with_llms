// 32.45182824134827s
// 1
function lambert_w(x)
    if x <= -1 then
        return -1;
    end if;
    if x >= 1 then
        return 1;
    end if;
    local y = 0;
    while abs(y) > 1e-6 do
        y = (x * log(x)) / (log(x) - 1);
    end while;
    return y;
end function