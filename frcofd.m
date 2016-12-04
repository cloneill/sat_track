%This function calculates the fraction of the day given an input in hours,
%minutes and seconds

function fraction = frcofd(hour, minute, second)

    format long;
    fraction = (hour/24)+(minute/(24*60))+(second/(24*3600));
end