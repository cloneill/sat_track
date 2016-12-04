% This function returns a three letter string (Sun, Mon, Tue, Wed, Thu, Fri, Sat) for the
% input date.

function dayString = getWeeklyDay(year, month, day)

    format long;
    
    %Computed from algorithm described on wikipedia
    %http://en.wikipedia.org/wiki/Calculating_the_day_of_the_week
    
    months=[0 3 3 6 1 4 6 2 5 0 3 5];
    days={'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'};
    
    century= floor(year/100);
    c = 2*(3-(mod(century,4)));
    
    ya=rem(year,100);
    y=ya+floor(ya/4);
    
    mstart = months(month);
    
    sum = c+y+mstart+day;
    dayis=rem(sum,7);
    
    dayString=days(dayis+1); %add 1 since arrays start at 1 in matlab
    
    return;
end