// 25.79279088973999s
// 1
function lambert_w(x)
    if x <= 0 then
        return -1;
    endif
    y = log(x);
    z = exp(y);
    while (z > x) do
        y = y + 1;
        z = exp(y);
    endwhile
    return y;
endfunction