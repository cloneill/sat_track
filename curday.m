% %The function CURDAY reads the system clock and returns the current date and time.
% Inputs include the computer?s timezone (in hours with sign, EASTERN = -5)
% corrected for DAYLIGHT saving. The function returns the formatted CURRENT date
% and time in UTC in CDATE as 1997-02-24 19:11:00.00

function NowUTC = CURDAY(timezone)
    format long;

    DAYS_IN_MONTH = [31 28 31 30 31 30 31 31 30 31 30 31];
    sys_clk = clock;

    year = sys_clk(1);
    month = sys_clk(2);
    day = sys_clk(3);
    hour = sys_clk(4);
    min = sys_clk(5);
    sec = floor(sys_clk(6));
    ms = rem(floor(sys_clk(6)*100), 100);

    hour = hour - timezone;
    if (hour < 0)
        hour = rem(hour+24,24);
        day = day - 1;
        if (day < 1)
            month = month - 1;
            if (month < 1)
                month = 12;
                year = year - 1;
            end
            day = DAYS_IN_MONTH(month);
            if (month == 2 && rem(year,4) == 0) % leap year
                day = day + 1;
            end
        end
    elseif (hour > 23)
        hour = rem(hour, 24);
        day = day + 1;
        leap_day = 0;
        if (month == 2 && rem(year,4) == 0) % leap year
            leap_day = 1;
        end
        if (day > DAYS_IN_MONTH(month) + leap_day)
            day = 1;
            month = rem(month + 1, 12);
        end
    end

    NowUTC = sprintf('%04i-%02i-%02i %02i:%02i:%02i.%02i', year, month, day, hour, min, sec, ms);