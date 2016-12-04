%The function DAT2JD converts a string CDSTR representing a UTC standard calendar
%date and time in format: 1997-02-24 19:11:00 to a Julian Day.

function julianDay = dat2JD(dateString)
    
    format long;
    
    dateVector=sscanf(dateString, '%d %*c %d %*c %d %d %*c %d %*c %d');
    
    zeroOfYear = jdaty(dateVector(1));
    dayOfYear = DOY(dateVector(1), dateVector(2), dateVector(3));
    fractionOfDay = frcofd(dateVector(4), dateVector(5), dateVector(6));
    julianDay = zeroOfYear + dayOfYear + fractionOfDay;
    return;
end