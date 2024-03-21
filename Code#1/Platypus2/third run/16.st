// 170.4133961200714s
// 1

program traffic_light;

use IEC61131-3;

var
    north_green : boolean;
    north_yellow : boolean;
    north_red : boolean;
    east_green : boolean;
    east_yellow : boolean;
    east_red : boolean;
    ton_timer : timer;

begin

    north_green := true;
    north_yellow := false;
    north_red := false;
    east_green := false;
    east_yellow := true;
    east_red := true;

    ton_timer.start(10000);

    while (true) do
        begin
            if (ton_timer.elapsed() < 5000) then
                begin
                    north_green := true;
                    north_yellow := false;
                    north_red := false;
                    east_green := false;
                    east_yellow := true;
                    east_red := true;
                end
            else if (ton_timer.elapsed() < 5500) then
                begin
                    north_green := false;
                    north_yellow := true;
                    north_red := false;
                    east_green := false;
                    east_yellow := true;
                    east_red := true;
                end
            else if (ton_timer.elapsed() < 9500) then
                begin
                    north_green := false;
                    north_yellow := false;
                    north_red := true;
                    east_green := false;
                    east_yellow := true;
                    east_red := true;
                end
            else if (ton_timer.elapsed() < 10000) then
                begin
                    north_green := false;
                    north_yellow := false;
                    north_red := false;
                    east_green := true;
                    east_yellow := false;
                    east_red := false;
                end
            else
                break;
        end;
end;